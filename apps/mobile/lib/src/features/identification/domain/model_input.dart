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
}
