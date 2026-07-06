import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/identification/data/classifier_compatibility_validator.dart';
import 'package:taxa_mobile/src/features/identification/domain/classifier_label_map.dart';
import 'package:taxa_mobile/src/features/identification/domain/classifier_model_config.dart';

void main() {
  const config = ClassifierModelConfig(
    modelAssetPath: 'assets/ml/test.tflite',
    labelMapAssetPath: 'assets/ml/test-labels.json',
    modelVersion: 'test-model-v1',
    labelMapVersion: 'test-labels-v1',
    inputSize: 2,
    threshold: 0.65,
    delegatePreference: ClassifierDelegatePreference.cpu,
  );

  const labelMap = ClassifierLabelMap(
    version: 'test-labels-v1',
    labels: [
      ClassifierLabel(
        index: 0,
        taxonomyEntryId: SeedIds.americanRobin,
        scientificName: 'Turdus migratorius',
        commonName: 'American Robin',
      ),
      ClassifierLabel(
        index: 1,
        taxonomyEntryId: SeedIds.monarchButterfly,
        scientificName: 'Danaus plexippus',
        commonName: 'Monarch Butterfly',
      ),
    ],
  );

  test('accepts matching config, label map, and tensor metadata', () {
    const validator = ClassifierCompatibilityValidator();

    validator.validateRuntime(
      config: config,
      labelMap: labelMap,
      metadata: const ClassifierRuntimeMetadata(
        inputShape: [1, 2, 2, 3],
        outputShape: [1, 2],
      ),
    );
  });

  test('rejects label map version mismatches', () {
    const validator = ClassifierCompatibilityValidator();

    expect(
      () => validator.validateLabelMap(
        config: config,
        labelMap: ClassifierLabelMap(
          version: 'other-labels-v1',
          labels: labelMap.labels,
        ),
      ),
      throwsA(isA<ClassifierCompatibilityException>()),
    );
  });

  test('rejects non-contiguous label indexes', () {
    const validator = ClassifierCompatibilityValidator();

    expect(
      () => validator.validateLabelMap(
        config: config,
        labelMap: const ClassifierLabelMap(
          version: 'test-labels-v1',
          labels: [
            ClassifierLabel(
              index: 1,
              taxonomyEntryId: SeedIds.monarchButterfly,
              scientificName: 'Danaus plexippus',
              commonName: 'Monarch Butterfly',
            ),
          ],
        ),
      ),
      throwsA(isA<ClassifierCompatibilityException>()),
    );
  });

  test('rejects unexpected input and output shapes', () {
    const validator = ClassifierCompatibilityValidator();

    expect(
      () => validator.validateRuntime(
        config: config,
        labelMap: labelMap,
        metadata: const ClassifierRuntimeMetadata(
          inputShape: [1, 224, 224, 3],
          outputShape: [1, 2],
        ),
      ),
      throwsA(isA<ClassifierCompatibilityException>()),
    );
    expect(
      () => validator.validateRuntime(
        config: config,
        labelMap: labelMap,
        metadata: const ClassifierRuntimeMetadata(
          inputShape: [1, 2, 2, 3],
          outputShape: [1, 3],
        ),
      ),
      throwsA(isA<ClassifierCompatibilityException>()),
    );
  });
}
