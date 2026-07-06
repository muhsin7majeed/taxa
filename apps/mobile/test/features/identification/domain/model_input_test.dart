import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/features/identification/domain/model_input.dart';

void main() {
  test('describes expected model input shape', () {
    final spec = ModelInputSpec.squareRgb(224);

    expect(spec.width, 224);
    expect(spec.height, 224);
    expect(spec.channels, 3);
    expect(spec.elementCount, 224 * 224 * 3);
    expect(spec.isValid, isTrue);
  });

  test('validates tensor length against spec', () {
    const spec = ModelInputSpec(width: 2, height: 2, channels: 3);

    expect(
      ModelInputTensor(
        spec: spec,
        values: List.filled(12, 0),
      ).hasExpectedLength,
      isTrue,
    );
    expect(
      ModelInputTensor(
        spec: spec,
        values: List.filled(11, 0),
      ).hasExpectedLength,
      isFalse,
    );
  });

  test('converts flat model values into a batched tensor', () {
    const spec = ModelInputSpec(width: 2, height: 1, channels: 3);
    final tensor = ModelInputTensor(
      spec: spec,
      values: [0, 0.1, 0.2, 0.3, 0.4, 0.5],
    );

    expect(tensor.toBatchedTensor(), [
      [
        [
          [0, 0.1, 0.2],
          [0.3, 0.4, 0.5],
        ],
      ],
    ]);
  });

  test('rejects batched tensor conversion for malformed values', () {
    const spec = ModelInputSpec(width: 2, height: 1, channels: 3);
    final tensor = ModelInputTensor(spec: spec, values: [0, 0.1]);

    expect(tensor.toBatchedTensor, throwsStateError);
  });
}
