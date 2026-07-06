import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/identification/data/classifier_label_map_loader.dart';
import 'package:taxa_mobile/src/features/identification/data/image_preprocessor.dart';
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

  test(
    'preprocesses image, runs interpreter, and decodes top predictions',
    () async {
      final preprocessor = _FakeImagePreprocessor();
      final handle = _FakeTfliteInterpreterHandle(scores: [0.2, 0.8]);
      final classifier = TfliteImageClassifier(
        config: config,
        labelMapLoader: const _FakeLabelMapLoader(labelMap),
        preprocessor: preprocessor,
        interpreterFactory: _FakeTfliteInterpreterFactory(handle),
      );

      final classification = await classifier.classifyImage(
        imagePath: 'captures/test.jpg',
      );

      expect(preprocessor.seenImagePath, 'captures/test.jpg');
      expect(preprocessor.seenSpec?.width, 2);
      expect(handle.seenInput, same(preprocessor.tensor));
      expect(handle.closed, isTrue);
      expect(classification.modelVersion, 'test-model-v1');
      expect(classification.labelMapVersion, 'test-labels-v1');
      expect(classification.topPrediction?.commonName, 'Monarch Butterfly');
      expect(classification.topPrediction?.confidence, 0.8);
    },
  );
}

class _FakeLabelMapLoader implements ClassifierLabelMapLoader {
  const _FakeLabelMapLoader(this.labelMap);

  final ClassifierLabelMap labelMap;

  @override
  Future<ClassifierLabelMap> load(String assetPath) async {
    return labelMap;
  }
}

class _FakeImagePreprocessor implements ImagePreprocessor {
  final tensor = ModelInputTensor(
    spec: ModelInputSpec.squareRgb(2),
    values: List.filled(12, 0.5),
  );

  String? seenImagePath;
  ModelInputSpec? seenSpec;

  @override
  Future<ModelInputTensor> preprocessFile({
    required String imagePath,
    required ModelInputSpec spec,
  }) async {
    seenImagePath = imagePath;
    seenSpec = spec;

    return tensor;
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
  _FakeTfliteInterpreterHandle({required this.scores});

  final List<double> scores;

  ModelInputTensor? seenInput;
  var closed = false;

  @override
  Future<List<double>> run(ModelInputTensor input) async {
    seenInput = input;

    return scores;
  }

  @override
  Future<void> close() async {
    closed = true;
  }
}
