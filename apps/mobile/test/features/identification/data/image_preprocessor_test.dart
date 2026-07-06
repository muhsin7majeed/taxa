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
}
