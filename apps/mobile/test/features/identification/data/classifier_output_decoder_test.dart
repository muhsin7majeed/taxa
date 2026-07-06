import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/identification/data/classifier_output_decoder.dart';
import 'package:taxa_mobile/src/features/identification/domain/classifier_label_map.dart';

void main() {
  const labelMap = ClassifierLabelMap(
    version: fakeCatalogVersion,
    labels: [
      ClassifierLabel(
        index: 0,
        taxonomyEntryId: SeedIds.americanRobin,
        scientificName: 'Turdus migratorius',
        commonName: 'American Robin',
      ),
      ClassifierLabel(
        index: 1,
        taxonomyEntryId: SeedIds.houseSparrow,
        scientificName: 'Passer domesticus',
        commonName: 'House Sparrow',
      ),
      ClassifierLabel(
        index: 2,
        taxonomyEntryId: SeedIds.monarchButterfly,
        scientificName: 'Danaus plexippus',
        commonName: 'Monarch Butterfly',
      ),
    ],
  );

  test('sorts model scores into top-k predictions', () {
    const decoder = ClassifierOutputDecoder();

    final predictions = decoder.decodeTopK(
      scores: [0.12, 0.8, 0.33],
      labelMap: labelMap,
      topK: 2,
    );

    expect(predictions.map((prediction) => prediction.commonName), [
      'House Sparrow',
      'Monarch Butterfly',
    ]);
    expect(predictions.map((prediction) => prediction.confidence), [0.8, 0.33]);
  });

  test('skips scores without labels and rejects invalid top-k', () {
    const decoder = ClassifierOutputDecoder();

    final predictions = decoder.decodeTopK(
      scores: [0.12, 0.8, 0.33, 0.99],
      labelMap: labelMap,
      topK: 4,
    );

    expect(predictions, hasLength(3));
    expect(
      () => decoder.decodeTopK(scores: [0.1], labelMap: labelMap, topK: 0),
      throwsArgumentError,
    );
  });
}
