import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/identification/data/classifier_compatibility_validator.dart';
import 'package:taxa_mobile/src/features/identification/data/classifier_label_map_loader.dart';
import 'package:taxa_mobile/src/features/identification/data/tflite_classifier_readiness_checker.dart';
import 'package:taxa_mobile/src/features/identification/data/tflite_image_classifier.dart';
import 'package:taxa_mobile/src/features/identification/domain/classifier_label_map.dart';
import 'package:taxa_mobile/src/features/identification/domain/classifier_model_config.dart';
import 'package:taxa_mobile/src/features/identification/domain/model_input.dart';

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

  test('returns readiness metadata for compatible model and labels', () async {
    final handle = _FakeTfliteInterpreterHandle(
      metadata: const ClassifierRuntimeMetadata(
        inputShape: [1, 2, 2, 3],
        outputShape: [1, 2],
      ),
    );
    final checker = TfliteClassifierReadinessChecker(
      config: config,
      labelMapLoader: const _FakeLabelMapLoader(labelMap),
      interpreterFactory: _FakeTfliteInterpreterFactory(handle),
    );

    final readiness = await checker.check();

    expect(readiness.modelVersion, 'test-model-v1');
    expect(readiness.labelMapVersion, 'test-labels-v1');
    expect(readiness.labelCount, 2);
    expect(readiness.inputShapeLabel, '1x2x2x3');
    expect(readiness.outputShapeLabel, '1x2');
    expect(handle.closed, isTrue);
  });

  test('closes interpreter when runtime validation fails', () async {
    final handle = _FakeTfliteInterpreterHandle(
      metadata: const ClassifierRuntimeMetadata(
        inputShape: [1, 2, 2, 3],
        outputShape: [1, 3],
      ),
    );
    final checker = TfliteClassifierReadinessChecker(
      config: config,
      labelMapLoader: const _FakeLabelMapLoader(labelMap),
      interpreterFactory: _FakeTfliteInterpreterFactory(handle),
    );

    await expectLater(
      checker.check(),
      throwsA(isA<ClassifierCompatibilityException>()),
    );
    expect(handle.closed, isTrue);
  });
}

class _FakeLabelMapLoader implements ClassifierLabelMapLoader {
  const _FakeLabelMapLoader(this.labelMap);

  final ClassifierLabelMap labelMap;

  @override
  Future<ClassifierLabelMap> load(String assetPath) async {
    return labelMap;
  }
}

class _FakeTfliteInterpreterFactory implements TfliteInterpreterFactory {
  const _FakeTfliteInterpreterFactory(this.handle);

  final _FakeTfliteInterpreterHandle handle;

  @override
  Future<TfliteInterpreterHandle> load(ClassifierModelConfig config) async {
    return handle;
  }
}

class _FakeTfliteInterpreterHandle implements TfliteInterpreterHandle {
  _FakeTfliteInterpreterHandle({required this.metadata});

  @override
  final ClassifierRuntimeMetadata metadata;

  var closed = false;

  @override
  Future<List<double>> run(ModelInputTensor input) async {
    return const [];
  }

  @override
  Future<void> close() async {
    closed = true;
  }
}
