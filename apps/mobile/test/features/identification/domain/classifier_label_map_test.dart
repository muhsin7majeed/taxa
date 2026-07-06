import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/identification/domain/classifier_label_map.dart';

void main() {
  test('parses labels and returns labels by model output index', () {
    final source = jsonEncode({
      'version': fakeCatalogVersion,
      'labels': [
        {
          'index': 2,
          'taxonomyEntryId': SeedIds.monarchButterfly,
          'scientificName': 'Danaus plexippus',
          'commonName': 'Monarch Butterfly',
        },
        {
          'index': 0,
          'taxonomyEntryId': SeedIds.americanRobin,
          'scientificName': 'Turdus migratorius',
          'commonName': 'American Robin',
        },
      ],
    });

    final labelMap = ClassifierLabelMap.fromJsonString(source);

    expect(labelMap.version, fakeCatalogVersion);
    expect(labelMap.labels.map((label) => label.index), [0, 2]);
    expect(labelMap.labelForIndex(0)?.commonName, 'American Robin');
    expect(
      labelMap.labelForIndex(2)?.taxonomyEntryId,
      SeedIds.monarchButterfly,
    );
    expect(labelMap.labelForIndex(1), isNull);
  });

  test('rejects malformed label maps', () {
    expect(
      () => ClassifierLabelMap.fromJsonString('[]'),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => ClassifierLabelMap.fromJson({'version': '', 'labels': []}),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => ClassifierLabelMap.fromJson({
        'version': fakeCatalogVersion,
        'labels': [
          {'index': -1},
        ],
      }),
      throwsA(isA<FormatException>()),
    );
  });
}
