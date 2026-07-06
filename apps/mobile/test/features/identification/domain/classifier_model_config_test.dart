import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/seed/taxa_seed_data.dart';
import 'package:taxa_mobile/src/features/identification/domain/classifier_model_config.dart';

void main() {
  test('mvp placeholder keeps model metadata behind a typed boundary', () {
    final config = ClassifierModelConfig.mvpPlaceholder();

    expect(config.modelAssetPath, 'assets/ml/taxa_mvp_classifier.tflite');
    expect(config.labelMapAssetPath, 'assets/ml/taxa_mvp_labels.json');
    expect(config.modelVersion, 'taxa-mvp-classifier-v0');
    expect(config.labelMapVersion, fakeCatalogVersion);
    expect(config.inputSize, 224);
    expect(config.threshold, 0.65);
    expect(config.delegatePreference, ClassifierDelegatePreference.cpu);
    expect(config.hasUsableInputSize, isTrue);
  });
}
