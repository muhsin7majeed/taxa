import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:image/image.dart' as image;

import '../domain/model_input.dart';

abstract interface class ImagePreprocessor {
  Future<ModelInputTensor> preprocessFile({
    required String imagePath,
    required ModelInputSpec spec,
  });
}

class DartImagePreprocessor implements ImagePreprocessor {
  const DartImagePreprocessor();

  @override
  Future<ModelInputTensor> preprocessFile({
    required String imagePath,
    required ModelInputSpec spec,
  }) async {
    final bytes = await File(imagePath).readAsBytes();
    return preprocessBytes(bytes: bytes, spec: spec);
  }

  ModelInputTensor preprocessBytes({
    required Uint8List bytes,
    required ModelInputSpec spec,
  }) {
    if (!_canPreprocess(spec)) {
      throw ArgumentError.value(
        spec,
        'spec',
        'Expected a valid square RGB spec.',
      );
    }

    final image.Image? decoded;
    try {
      decoded = image.decodeImage(bytes);
    } on Object {
      throw const FormatException('Could not decode image bytes.');
    }

    if (decoded == null) {
      throw const FormatException('Could not decode image bytes.');
    }

    return preprocessImage(source: decoded, spec: spec);
  }

  ModelInputTensor preprocessImage({
    required image.Image source,
    required ModelInputSpec spec,
  }) {
    if (!_canPreprocess(spec)) {
      throw ArgumentError.value(
        spec,
        'spec',
        'Expected a valid square RGB spec.',
      );
    }

    final oriented = image.bakeOrientation(source);
    final resized = image.copyResizeCropSquare(
      oriented,
      size: spec.width,
      interpolation: image.Interpolation.linear,
    );
    final values = List<double>.filled(spec.elementCount, 0);
    var valueIndex = 0;

    for (var y = 0; y < spec.height; y += 1) {
      for (var x = 0; x < spec.width; x += 1) {
        final pixel = resized.getPixel(x, y);
        values[valueIndex] = (pixel.r / 255.0).toDouble();
        values[valueIndex + 1] = (pixel.g / 255.0).toDouble();
        values[valueIndex + 2] = (pixel.b / 255.0).toDouble();
        valueIndex += 3;
      }
    }

    return ModelInputTensor(spec: spec, values: values);
  }

  bool _canPreprocess(ModelInputSpec spec) {
    return spec.isValid && spec.width == spec.height && spec.channels == 3;
  }
}

class IsolateImagePreprocessor implements ImagePreprocessor {
  const IsolateImagePreprocessor();

  @override
  Future<ModelInputTensor> preprocessFile({
    required String imagePath,
    required ModelInputSpec spec,
  }) {
    return Isolate.run(() {
      return const DartImagePreprocessor().preprocessFile(
        imagePath: imagePath,
        spec: spec,
      );
    });
  }
}
