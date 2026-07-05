import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/storage/database/taxa_database.dart';
import '../../../core/storage/seed/taxa_seed_data.dart';
import '../domain/collection_models.dart';

class LocalCatalogRepository {
  LocalCatalogRepository(this._database, {Uuid? uuid}) : _uuid = uuid ?? Uuid();

  final TaxaDatabase _database;
  final Uuid _uuid;

  Future<void> ensureSeeded() async {
    final now = DateTime.utc(2026, 1, 1);

    await _database.transaction(() async {
      for (final entry in seedTaxonomyEntries) {
        await _database
            .into(_database.taxonomyEntries)
            .insertOnConflictUpdate(
              TaxonomyEntriesCompanion.insert(
                id: entry.id,
                scientificName: entry.scientificName,
                commonName: entry.commonName,
                category: entry.category,
                rarity: entry.rarity,
                habitat: entry.habitat,
                diet: entry.diet,
                sizeDescription: entry.sizeDescription,
                catalogVersion: fakeCatalogVersion,
                sortOrder: Value(entry.sortOrder),
                createdAt: now,
                updatedAt: now,
              ),
            );
      }

      for (final group in seedChecklistGroups) {
        await _database
            .into(_database.checklistGroups)
            .insertOnConflictUpdate(
              ChecklistGroupsCompanion.insert(
                id: group.id,
                name: group.name,
                description: group.description,
                catalogVersion: fakeCatalogVersion,
                sortOrder: Value(group.sortOrder),
                createdAt: now,
                updatedAt: now,
              ),
            );
      }

      for (final membership in seedChecklistMemberships) {
        await _database
            .into(_database.checklistEntries)
            .insert(
              ChecklistEntriesCompanion.insert(
                checklistGroupId: membership.checklistGroupId,
                taxonomyEntryId: membership.taxonomyEntryId,
                createdAt: now,
                updatedAt: now,
              ),
              mode: InsertMode.insertOrIgnore,
            );
      }
    });
  }

  Future<List<TaxonomyEntry>> loadTaxonomyEntries() {
    return (_database.select(
      _database.taxonomyEntries,
    )..orderBy([(table) => OrderingTerm.asc(table.sortOrder)])).get();
  }

  Future<Discovery> recordDiscoveryForTaxonomy({
    required String taxonomyEntryId,
    DateTime? discoveredAt,
  }) async {
    final now = discoveredAt ?? DateTime.now().toUtc();
    final id = _uuid.v4();

    await _database
        .into(_database.discoveries)
        .insert(
          DiscoveriesCompanion.insert(
            id: id,
            taxonomyEntryId: taxonomyEntryId,
            discoveredAt: now,
            createdAt: now,
            updatedAt: now,
          ),
        );

    return (_database.select(
      _database.discoveries,
    )..where((table) => table.id.equals(id))).getSingle();
  }

  Stream<List<ChecklistProgress>> watchChecklistProgress() {
    return _checklistProgressQuery().watch().map(_mapChecklistProgressRows);
  }

  Future<List<ChecklistProgress>> loadChecklistProgress() async {
    return _mapChecklistProgressRows(await _checklistProgressQuery().get());
  }

  Stream<CollectionOverview> watchCollectionOverview() {
    return _collectionOverviewQuery().watch().asyncMap((rows) async {
      final row = rows.single;

      return CollectionOverview(
        foundSpecies: row.read<int>('found_species'),
        totalSpecies: row.read<int>('total_species'),
        localDiscoveryCount: row.read<int>('local_discovery_count'),
        packs: await loadChecklistProgress(),
      );
    });
  }

  Future<CollectionOverview> loadCollectionOverview() async {
    final row = (await _collectionOverviewQuery().get()).single;

    return CollectionOverview(
      foundSpecies: row.read<int>('found_species'),
      totalSpecies: row.read<int>('total_species'),
      localDiscoveryCount: row.read<int>('local_discovery_count'),
      packs: await loadChecklistProgress(),
    );
  }

  Selectable<QueryRow> _checklistProgressQuery() {
    return _database.customSelect(
      '''
      SELECT
        cg.id AS id,
        cg.name AS title,
        cg.description AS subtitle,
        cg.sort_order AS sort_order,
        COUNT(ce.taxonomy_entry_id) AS total_count,
        COUNT(DISTINCT d.taxonomy_entry_id) AS found_count
      FROM checklist_groups cg
      LEFT JOIN checklist_entries ce ON ce.checklist_group_id = cg.id
      LEFT JOIN discoveries d ON d.taxonomy_entry_id = ce.taxonomy_entry_id
      GROUP BY cg.id, cg.name, cg.description, cg.sort_order
      ORDER BY cg.sort_order ASC
      ''',
      readsFrom: {
        _database.checklistGroups,
        _database.checklistEntries,
        _database.discoveries,
      },
    );
  }

  Selectable<QueryRow> _collectionOverviewQuery() {
    return _database.customSelect(
      '''
      SELECT
        COUNT(te.id) AS total_species,
        COUNT(DISTINCT d.taxonomy_entry_id) AS found_species,
        COUNT(d.id) AS local_discovery_count
      FROM taxonomy_entries te
      LEFT JOIN discoveries d ON d.taxonomy_entry_id = te.id
      ''',
      readsFrom: {_database.taxonomyEntries, _database.discoveries},
    );
  }

  List<ChecklistProgress> _mapChecklistProgressRows(List<QueryRow> rows) {
    return [
      for (final row in rows)
        ChecklistProgress(
          id: row.read<String>('id'),
          title: row.read<String>('title'),
          subtitle: row.read<String>('subtitle'),
          sortOrder: row.read<int>('sort_order'),
          total: row.read<int>('total_count'),
          found: row.read<int>('found_count'),
        ),
    ];
  }
}
