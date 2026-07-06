import '../domain/classifier_label_map.dart';
import '../domain/classifier_model_config.dart';

class ClassifierRuntimeMetadata {
  const ClassifierRuntimeMetadata({
    required this.inputShape,
    required this.outputShape,
  });

  final List<int> inputShape;
  final List<int> outputShape;

  int get outputClassCount {
    if (outputShape.isEmpty) {
      return 0;
    }

    return outputShape.last;
  }
}

class ClassifierCompatibilityValidator {
  const ClassifierCompatibilityValidator();

  void validateLabelMap({
    required ClassifierModelConfig config,
    required ClassifierLabelMap labelMap,
  }) {
    if (!config.hasUsableInputSize) {
      throw ClassifierCompatibilityException(
        'Model input size must be greater than zero.',
      );
    }

    if (labelMap.version != config.labelMapVersion) {
      throw ClassifierCompatibilityException(
        'Label map version ${labelMap.version} does not match expected '
        '${config.labelMapVersion}.',
      );
    }

    if (labelMap.labels.isEmpty) {
      throw ClassifierCompatibilityException('Label map must not be empty.');
    }

    final indexes = labelMap.labels.map((label) => label.index).toList()
      ..sort();

    for (var index = 0; index < indexes.length; index += 1) {
      if (indexes[index] != index) {
        throw ClassifierCompatibilityException(
          'Label map indexes must be contiguous from 0.',
        );
      }
    }
  }

  void validateRuntime({
    required ClassifierModelConfig config,
    required ClassifierLabelMap labelMap,
    required ClassifierRuntimeMetadata metadata,
  }) {
    validateLabelMap(config: config, labelMap: labelMap);
    _validateInputShape(config, metadata);
    _validateOutputShape(labelMap, metadata);
  }

  void _validateInputShape(
    ClassifierModelConfig config,
    ClassifierRuntimeMetadata metadata,
  ) {
    final shape = metadata.inputShape;

    if (shape.length != 4) {
      throw ClassifierCompatibilityException(
        'Model input shape must be [1, height, width, channels].',
      );
    }

    if (shape[0] != 1 ||
        shape[1] != config.inputSize ||
        shape[2] != config.inputSize ||
        shape[3] != 3) {
      throw ClassifierCompatibilityException(
        'Model input shape ${shape.join('x')} does not match expected '
        '1x${config.inputSize}x${config.inputSize}x3.',
      );
    }
  }

  void _validateOutputShape(
    ClassifierLabelMap labelMap,
    ClassifierRuntimeMetadata metadata,
  ) {
    if (metadata.outputClassCount != labelMap.labels.length) {
      throw ClassifierCompatibilityException(
        'Model output count ${metadata.outputClassCount} does not match '
        'label count ${labelMap.labels.length}.',
      );
    }
  }
}

class ClassifierCompatibilityException implements Exception {
  const ClassifierCompatibilityException(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}
