import '../domain/classifier_model_config.dart';
import 'classifier_compatibility_validator.dart';
import 'classifier_label_map_loader.dart';
import 'tflite_image_classifier.dart';

class TfliteClassifierReadinessChecker {
  TfliteClassifierReadinessChecker({
    required this.config,
    ClassifierLabelMapLoader? labelMapLoader,
    ClassifierCompatibilityValidator? compatibilityValidator,
    TfliteInterpreterFactory? interpreterFactory,
  }) : labelMapLoader = labelMapLoader ?? AssetClassifierLabelMapLoader(),
       compatibilityValidator =
           compatibilityValidator ?? const ClassifierCompatibilityValidator(),
       interpreterFactory =
           interpreterFactory ??
           const AssetTfliteInterpreterFactory(runInBackgroundIsolate: false);

  final ClassifierModelConfig config;
  final ClassifierLabelMapLoader labelMapLoader;
  final ClassifierCompatibilityValidator compatibilityValidator;
  final TfliteInterpreterFactory interpreterFactory;

  Future<TfliteClassifierReadiness> check() async {
    final labelMap = await labelMapLoader.load(config.labelMapAssetPath);
    compatibilityValidator.validateLabelMap(config: config, labelMap: labelMap);

    final interpreter = await interpreterFactory.load(config);

    try {
      final metadata = interpreter.metadata;
      compatibilityValidator.validateRuntime(
        config: config,
        labelMap: labelMap,
        metadata: metadata,
      );

      return TfliteClassifierReadiness(
        modelVersion: config.modelVersion,
        labelMapVersion: labelMap.version,
        labelCount: labelMap.labels.length,
        inputShape: metadata.inputShape,
        outputShape: metadata.outputShape,
      );
    } finally {
      await interpreter.close();
    }
  }
}

class TfliteClassifierReadiness {
  const TfliteClassifierReadiness({
    required this.modelVersion,
    required this.labelMapVersion,
    required this.labelCount,
    required this.inputShape,
    required this.outputShape,
  });

  final String modelVersion;
  final String labelMapVersion;
  final int labelCount;
  final List<int> inputShape;
  final List<int> outputShape;

  String get inputShapeLabel => inputShape.join('x');

  String get outputShapeLabel => outputShape.join('x');
}
