import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/database/taxa_database.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/camera_capture/data/capture_attempt_repository.dart';
import 'package:taxa_mobile/src/features/collection/data/local_catalog_repository.dart';
import 'package:taxa_mobile/src/features/identification/data/identification_attempt_repository.dart';
import 'package:taxa_mobile/src/features/identification/data/identification_workflow.dart';
import 'package:taxa_mobile/src/features/identification/domain/identification_decision.dart';
import 'package:taxa_mobile/src/features/identification/domain/image_classifier.dart';

void main() {
  late TaxaDatabase database;
  late LocalCatalogRepository catalogRepository;
  late CaptureAttemptRepository captureRepository;

  setUp(() {
    database = TaxaDatabase(NativeDatabase.memory());
    catalogRepository = LocalCatalogRepository(database);
    captureRepository = CaptureAttemptRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('fake classifier flow creates local discovery and progress', () async {
    final workflow = IdentificationWorkflow(
      classifier: const FakeImageClassifier(latency: Duration.zero),
      decisionPolicy: const ConfidenceThresholdPolicy(threshold: 0.65),
      attemptRepository: IdentificationAttemptRepository(database),
      catalogRepository: catalogRepository,
    );
    final capture = await captureRepository.recordCameraCapture(
      imagePath: 'app-support/captures/example.jpg',
      capturedAt: DateTime.utc(2026, 7, 6, 9, 30),
    );

    final outcome = await workflow.identifyCapture(capture);
    final overview = await catalogRepository.loadCollectionOverview();
    final progress = await catalogRepository.loadChecklistProgress();
    final backyard = progress.firstWhere(
      (group) => group.id == SeedIds.backyardBirdsAndBugs,
    );

    expect(outcome.isIdentified, isTrue);
    expect(outcome.taxonomyEntry?.id, SeedIds.americanRobin);
    expect(outcome.discovery, isNotNull);
    expect(overview.foundSpecies, 1);
    expect(overview.localDiscoveryCount, 1);
    expect(backyard.found, 1);
  });
}
