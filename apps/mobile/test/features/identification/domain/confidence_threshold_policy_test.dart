import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/identification/domain/identification_decision.dart';
import 'package:taxa_mobile/src/features/identification/domain/image_classifier.dart';

void main() {
  const prediction = ImageClassifierPrediction(
    taxonomyEntryId: SeedIds.americanRobin,
    scientificName: 'Turdus migratorius',
    commonName: 'American Robin',
    confidence: 0.7,
  );

  test('accepts top prediction at or above threshold', () {
    const policy = ConfidenceThresholdPolicy(threshold: 0.65);
    const classification = ImageClassification(
      modelVersion: 'fake',
      labelMapVersion: fakeCatalogVersion,
      predictions: [prediction],
    );

    final decision = policy.decide(classification);

    expect(decision.status, IdentificationStatus.identified);
    expect(decision.acceptedPrediction, prediction);
    expect(decision.threshold, 0.65);
  });

  test('rejects top prediction below threshold', () {
    const policy = ConfidenceThresholdPolicy(threshold: 0.75);
    const classification = ImageClassification(
      modelVersion: 'fake',
      labelMapVersion: fakeCatalogVersion,
      predictions: [prediction],
    );

    final decision = policy.decide(classification);

    expect(decision.status, IdentificationStatus.unidentified);
    expect(decision.acceptedPrediction, isNull);
  });
}
