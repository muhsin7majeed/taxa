import 'dart:io';

import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

import '../domain/classifier_label_map.dart';
import '../domain/classifier_model_config.dart';
import '../domain/image_classifier.dart';
import 'classifier_label_map_loader.dart';

class TfliteImageClassifier implements ImageClassifier {
  TfliteImageClassifier({
    required this.config,
    ClassifierLabelMapLoader? labelMapLoader,
    TfliteInterpreterFactory? interpreterFactory,
  }) : labelMapLoader = labelMapLoader ?? AssetClassifierLabelMapLoader(),
       interpreterFactory =
           interpreterFactory ?? const AssetTfliteInterpreterFactory();

  final ClassifierModelConfig config;
  final ClassifierLabelMapLoader labelMapLoader;
  final TfliteInterpreterFactory interpreterFactory;

  @override
  Future<ImageClassification> classifyImage({required String imagePath}) async {
    final labelMap = await labelMapLoader.load(config.labelMapAssetPath);
    final interpreter = await interpreterFactory.load(config);
    interpreter.close();

    throw TfliteClassifierNotReadyException(
      'Loaded ${labelMap.labels.length} labels for ${config.modelVersion}, '
      'but tensor preprocessing and output decoding are not implemented yet.',
    );
  }
}

class TfliteClassifierNotReadyException implements Exception {
  const TfliteClassifierNotReadyException(this.message);

  final String message;

  @override
  String toString() => message;
}

abstract interface class TfliteInterpreterFactory {
  Future<TfliteInterpreterHandle> load(ClassifierModelConfig config);
}

abstract interface class TfliteInterpreterHandle {
  void close();
}

class AssetTfliteInterpreterFactory implements TfliteInterpreterFactory {
  const AssetTfliteInterpreterFactory();

  @override
  Future<TfliteInterpreterHandle> load(ClassifierModelConfig config) async {
    final options = _buildOptions(config);
    final interpreter = await tfl.Interpreter.fromAsset(
      config.modelAssetPath,
      options: options,
    );

    return _TfliteInterpreterHandle(interpreter);
  }

  tfl.InterpreterOptions _buildOptions(ClassifierModelConfig config) {
    final options = tfl.InterpreterOptions()..threads = 2;

    switch (config.delegatePreference) {
      case ClassifierDelegatePreference.cpu:
        break;
      case ClassifierDelegatePreference.gpu:
        if (Platform.isAndroid) {
          options.addDelegate(tfl.GpuDelegateV2());
        } else if (Platform.isIOS) {
          options.useMetalDelegateForIOS = true;
        }
      case ClassifierDelegatePreference.nnapi:
        options.useNnApiForAndroid = true;
    }

    return options;
  }
}

class _TfliteInterpreterHandle implements TfliteInterpreterHandle {
  const _TfliteInterpreterHandle(this._interpreter);

  final tfl.Interpreter _interpreter;

  @override
  void close() {
    _interpreter.close();
  }
}

ImageClassifierPrediction predictionFromLabel({
  required ClassifierLabel label,
  required double confidence,
}) {
  return ImageClassifierPrediction(
    taxonomyEntryId: label.taxonomyEntryId,
    scientificName: label.scientificName,
    commonName: label.commonName,
    confidence: confidence,
  );
}
