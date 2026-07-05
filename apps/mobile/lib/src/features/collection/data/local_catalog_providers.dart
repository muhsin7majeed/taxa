import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/database/taxa_database.dart';
import '../domain/collection_models.dart';
import 'local_catalog_repository.dart';

final taxaDatabaseProvider = Provider<TaxaDatabase>((ref) {
  final database = TaxaDatabase();
  ref.onDispose(database.close);
  return database;
});

final localCatalogRepositoryProvider = Provider<LocalCatalogRepository>((ref) {
  return LocalCatalogRepository(ref.watch(taxaDatabaseProvider));
});

final localCatalogSeedProvider = FutureProvider<void>((ref) async {
  await ref.watch(localCatalogRepositoryProvider).ensureSeeded();
});

final collectionOverviewProvider = StreamProvider<CollectionOverview>((
  ref,
) async* {
  await ref.watch(localCatalogSeedProvider.future);
  yield* ref.watch(localCatalogRepositoryProvider).watchCollectionOverview();
});

final checklistProgressProvider = StreamProvider<List<ChecklistProgress>>((
  ref,
) async* {
  await ref.watch(localCatalogSeedProvider.future);
  yield* ref.watch(localCatalogRepositoryProvider).watchChecklistProgress();
});
