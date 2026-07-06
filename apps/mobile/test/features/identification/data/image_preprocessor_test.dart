import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as image;
import 'package:taxa_mobile/src/features/identification/data/image_preprocessor.dart';
import 'package:taxa_mobile/src/features/identification/domain/model_input.dart';

void main() {
  test('decodes, crops, resizes, and normalizes RGB image bytes', () {
    const preprocessor = DartImagePreprocessor();
    final source = image.Image(width: 2, height: 2)
      ..setPixelRgb(0, 0, 255, 0, 0)
      ..setPixelRgb(1, 0, 0, 255, 0)
      ..setPixelRgb(0, 1, 0, 0, 255)
      ..setPixelRgb(1, 1, 255, 255, 255);
    final bytes = Uint8List.fromList(image.encodePng(source));

    final tensor = preprocessor.preprocessBytes(
      bytes: bytes,
      spec: ModelInputSpec.squareRgb(2),
    );

    expect(tensor.hasExpectedLength, isTrue);
    expect(tensor.values, hasLength(12));
    expect(tensor.values.take(3), [1.0, 0.0, 0.0]);
    expect(tensor.values.skip(3).take(3), [0.0, 1.0, 0.0]);
    expect(tensor.values.skip(6).take(3), [0.0, 0.0, 1.0]);
    expect(tensor.values.skip(9).take(3), [1.0, 1.0, 1.0]);
  });

  test('rejects undecodable image bytes', () {
    const preprocessor = DartImagePreprocessor();

    expect(
      () => preprocessor.preprocessBytes(
        bytes: Uint8List.fromList([1, 2, 3]),
        spec: ModelInputSpec.squareRgb(2),
      ),
      throwsFormatException,
    );
  });

  test('rejects non-square RGB model specs', () {
    const preprocessor = DartImagePreprocessor();
    final source = image.Image(width: 2, height: 2);

    expect(
      () => preprocessor.preprocessImage(
        source: source,
        spec: const ModelInputSpec(width: 2, height: 1, channels: 3),
      ),
      throwsArgumentError,
    );
  });

  test('preprocesses files in a background isolate', () async {
    const preprocessor = IsolateImagePreprocessor();
    final tempDir = await Directory.systemTemp.createTemp(
      'taxa_image_preprocessor_test',
    );
    final imageFile = File('${tempDir.path}/capture.png');
    final source = image.Image(width: 1, height: 1)
      ..setPixelRgb(0, 0, 128, 64, 32);
    await imageFile.writeAsBytes(image.encodePng(source));

    try {
      final tensor = await preprocessor.preprocessFile(
        imagePath: imageFile.path,
        spec: ModelInputSpec.squareRgb(1),
      );

      expect(tensor.hasExpectedLength, isTrue);
      expect(tensor.values[0], closeTo(128 / 255, 0.001));
      expect(tensor.values[1], closeTo(64 / 255, 0.001));
      expect(tensor.values[2], closeTo(32 / 255, 0.001));
    } finally {
      await tempDir.delete(recursive: true);
    }
  });
}
