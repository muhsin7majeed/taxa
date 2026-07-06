import 'dart:io';

import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

import '../domain/classifier_model_config.dart';
import '../domain/image_classifier.dart';
import '../domain/model_input.dart';
import 'classifier_label_map_loader.dart';
import 'classifier_output_decoder.dart';
import 'image_preprocessor.dart';

class TfliteImageClassifier implements ImageClassifier {
  TfliteImageClassifier({
    required this.config,
    ClassifierLabelMapLoader? labelMapLoader,
    ImagePreprocessor? preprocessor,
    ClassifierOutputDecoder? outputDecoder,
    TfliteInterpreterFactory? interpreterFactory,
  }) : labelMapLoader = labelMapLoader ?? AssetClassifierLabelMapLoader(),
       preprocessor = preprocessor ?? const DartImagePreprocessor(),
       outputDecoder = outputDecoder ?? const ClassifierOutputDecoder(),
       interpreterFactory =
           interpreterFactory ?? const AssetTfliteInterpreterFactory();

  final ClassifierModelConfig config;
  final ClassifierLabelMapLoader labelMapLoader;
  final ImagePreprocessor preprocessor;
  final ClassifierOutputDecoder outputDecoder;
  final TfliteInterpreterFactory interpreterFactory;

  @override
  Future<ImageClassification> classifyImage({required String imagePath}) async {
    final labelMap = await labelMapLoader.load(config.labelMapAssetPath);
    final input = await preprocessor.preprocessFile(
      imagePath: imagePath,
      spec: ModelInputSpec.squareRgb(config.inputSize),
    );
    final interpreter = await interpreterFactory.load(config);

    try {
      final scores = await interpreter.run(input);
      final predictions = outputDecoder.decodeTopK(
        scores: scores,
        labelMap: labelMap,
      );

      return ImageClassification(
        modelVersion: config.modelVersion,
        labelMapVersion: labelMap.version,
        predictions: predictions,
      );
    } finally {
      interpreter.close();
    }
  }
}

abstract interface class TfliteInterpreterFactory {
  Future<TfliteInterpreterHandle> load(ClassifierModelConfig config);
}

abstract interface class TfliteInterpreterHandle {
  Future<List<double>> run(ModelInputTensor input);

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
  Future<List<double>> run(ModelInputTensor input) async {
    final outputShape = _interpreter.getOutputTensor(0).shape;
    final outputLength = outputShape.isEmpty ? 0 : outputShape.last;

    if (outputLength <= 0) {
      throw StateError('TFLite classifier output tensor is empty.');
    }

    final output = [List<double>.filled(outputLength, 0)];
    _interpreter.run(input.toBatchedTensor(), output);

    return output.single;
  }

  @override
  void close() {
    _interpreter.close();
  }
}
