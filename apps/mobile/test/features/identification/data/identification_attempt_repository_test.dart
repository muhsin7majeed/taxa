import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/database/taxa_database.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/camera_capture/data/capture_attempt_repository.dart';
import 'package:taxa_mobile/src/features/collection/data/local_catalog_repository.dart';
import 'package:taxa_mobile/src/features/identification/data/identification_attempt_repository.dart';
import 'package:taxa_mobile/src/features/identification/domain/identification_decision.dart';
import 'package:taxa_mobile/src/features/identification/domain/image_classifier.dart';

void main() {
  late TaxaDatabase database;
  late LocalCatalogRepository catalogRepository;
  late CaptureAttemptRepository captureRepository;
  late IdentificationAttemptRepository identificationRepository;

  setUp(() {
    database = TaxaDatabase(NativeDatabase.memory());
    catalogRepository = LocalCatalogRepository(database);
    captureRepository = CaptureAttemptRepository(database);
    identificationRepository = IdentificationAttemptRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('records successful identification and creates discovery', () async {
    await catalogRepository.ensureSeeded();
    final capture = await _recordCapture(captureRepository);
    const classification = ImageClassification(
      modelVersion: 'fake-local-classifier-v1',
      labelMapVersion: fakeCatalogVersion,
      predictions: [
        ImageClassifierPrediction(
          taxonomyEntryId: SeedIds.americanRobin,
          scientificName: 'Turdus migratorius',
          commonName: 'American Robin',
          confidence: 0.87,
        ),
      ],
    );
    final decision = const ConfidenceThresholdPolicy(
      threshold: 0.65,
    ).decide(classification);

    final outcome = await identificationRepository.recordClassification(
      captureAttempt: capture,
      classification: classification,
      decision: decision,
      attemptedAt: DateTime.utc(2026, 7, 6, 10),
    );

    expect(outcome.isIdentified, isTrue);
    expect(outcome.taxonomyEntry?.id, SeedIds.americanRobin);
    expect(outcome.discovery, isNotNull);
    expect(outcome.attempt.status, 'identified');
    expect(outcome.attempt.captureAttemptId, capture.id);
    expect(outcome.attempt.taxonomyEntryId, SeedIds.americanRobin);
    expect(outcome.attempt.modelVersion, 'fake-local-classifier-v1');
    expect(outcome.attempt.labelMapVersion, fakeCatalogVersion);
    expect(outcome.attempt.threshold, 0.65);
    expect(outcome.attempt.topConfidence, 0.87);
    expect(outcome.attempt.syncState, 'local');
    expect(outcome.discovery?.captureAttemptId, capture.id);
    expect(outcome.discovery?.identificationAttemptId, outcome.attempt.id);
    expect(outcome.discovery?.syncState, 'local');

    final topK = jsonDecode(outcome.attempt.topKJson!) as List<dynamic>;
    expect(topK.single, containsPair('taxonomyEntryId', SeedIds.americanRobin));
  });

  test('records low-confidence attempt without creating discovery', () async {
    await catalogRepository.ensureSeeded();
    final capture = await _recordCapture(captureRepository);
    const classification = ImageClassification(
      modelVersion: 'fake-local-classifier-v1',
      labelMapVersion: fakeCatalogVersion,
      predictions: [
        ImageClassifierPrediction(
          taxonomyEntryId: SeedIds.americanRobin,
          scientificName: 'Turdus migratorius',
          commonName: 'American Robin',
          confidence: 0.42,
        ),
      ],
    );
    final decision = const ConfidenceThresholdPolicy(
      threshold: 0.65,
    ).decide(classification);

    final outcome = await identificationRepository.recordClassification(
      captureAttempt: capture,
      classification: classification,
      decision: decision,
      attemptedAt: DateTime.utc(2026, 7, 6, 10),
    );
    final discoveries = await database.select(database.discoveries).get();

    expect(outcome.isIdentified, isFalse);
    expect(outcome.discovery, isNull);
    expect(outcome.taxonomyEntry, isNull);
    expect(outcome.attempt.status, 'unidentified');
    expect(outcome.attempt.taxonomyEntryId, isNull);
    expect(outcome.attempt.captureAttemptId, capture.id);
    expect(outcome.attempt.topConfidence, 0.42);
    expect(discoveries, isEmpty);
  });
}

Future<CaptureAttempt> _recordCapture(CaptureAttemptRepository repository) {
  return repository.recordCameraCapture(
    imagePath: 'app-support/captures/example.jpg',
    capturedAt: DateTime.utc(2026, 7, 6, 9, 30),
    metadataJson: '{"source":"camera"}',
  );
}
