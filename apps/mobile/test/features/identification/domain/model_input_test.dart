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
}
