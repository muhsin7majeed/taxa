import '../../../core/storage/seed/taxa_seed_data.dart';

enum ClassifierDelegatePreference { cpu, gpu, nnapi }

class ClassifierModelConfig {
  const ClassifierModelConfig({
    required this.modelAssetPath,
    required this.labelMapAssetPath,
    required this.modelVersion,
    required this.labelMapVersion,
    required this.inputSize,
    required this.threshold,
    required this.delegatePreference,
  });

  factory ClassifierModelConfig.mvpPlaceholder() {
    return const ClassifierModelConfig(
      modelAssetPath: 'assets/ml/taxa_mvp_classifier.tflite',
      labelMapAssetPath: 'assets/ml/taxa_mvp_labels.json',
      modelVersion: 'taxa-mvp-classifier-v0',
      labelMapVersion: fakeCatalogVersion,
      inputSize: 224,
      threshold: 0.65,
      delegatePreference: ClassifierDelegatePreference.cpu,
    );
  }

  final String modelAssetPath;
  final String labelMapAssetPath;
  final String modelVersion;
  final String labelMapVersion;
  final int inputSize;
  final double threshold;
  final ClassifierDelegatePreference delegatePreference;

  bool get hasUsableInputSize => inputSize > 0;
}
