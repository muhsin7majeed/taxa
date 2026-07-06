class ModelInputSpec {
  const ModelInputSpec({
    required this.width,
    required this.height,
    required this.channels,
  });

  factory ModelInputSpec.squareRgb(int size) {
    return ModelInputSpec(width: size, height: size, channels: 3);
  }

  final int width;
  final int height;
  final int channels;

  int get elementCount => width * height * channels;

  bool get isValid {
    return width > 0 && height > 0 && channels > 0;
  }
}

class ModelInputTensor {
  const ModelInputTensor({required this.spec, required this.values});

  final ModelInputSpec spec;
  final List<double> values;

  bool get hasExpectedLength {
    return values.length == spec.elementCount;
  }

  List<List<List<List<double>>>> toBatchedTensor() {
    if (!hasExpectedLength) {
      throw StateError('Model input tensor length does not match its spec.');
    }

    var valueIndex = 0;

    return [
      [
        for (var y = 0; y < spec.height; y += 1)
          [
            for (var x = 0; x < spec.width; x += 1)
              [
                for (var channel = 0; channel < spec.channels; channel += 1)
                  values[valueIndex++],
              ],
          ],
      ],
    ];
  }
}
