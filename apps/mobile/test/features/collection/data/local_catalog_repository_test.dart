import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/database/taxa_database.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/collection/data/local_catalog_repository.dart';

void main() {
  late TaxaDatabase database;
  late LocalCatalogRepository repository;

  setUp(() {
    database = TaxaDatabase(NativeDatabase.memory());
    repository = LocalCatalogRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('seeds taxonomy and checklist data idempotently', () async {
    await repository.ensureSeeded();
    await repository.ensureSeeded();

    final entries = await repository.loadTaxonomyEntries();
    final progress = await repository.loadChecklistProgress();

    expect(entries, hasLength(seedTaxonomyEntries.length));
    expect(progress, hasLength(seedChecklistGroups.length));
    expect(progress.map((group) => group.total), containsAll([5, 3]));
    expect(progress.every((group) => group.found == 0), isTrue);
  });

  test(
    'calculates collection and checklist progress from local discoveries',
    () async {
      await repository.ensureSeeded();

      await repository.recordDiscoveryForTaxonomy(
        taxonomyEntryId: SeedIds.americanRobin,
        discoveredAt: DateTime.utc(2026, 7, 5),
      );

      final overview = await repository.loadCollectionOverview();
      final progress = await repository.loadChecklistProgress();
      final backyard = progress.firstWhere(
        (group) => group.id == SeedIds.backyardBirdsAndBugs,
      );
      final freshwater = progress.firstWhere(
        (group) => group.id == SeedIds.freshwaterSightings,
      );

      expect(overview.totalSpecies, seedTaxonomyEntries.length);
      expect(overview.foundSpecies, 1);
      expect(overview.localDiscoveryCount, 1);
      expect(overview.lockedSpecies, seedTaxonomyEntries.length - 1);
      expect(backyard.found, 1);
      expect(backyard.total, 5);
      expect(freshwater.found, 0);
      expect(freshwater.total, 3);
    },
  );
}
