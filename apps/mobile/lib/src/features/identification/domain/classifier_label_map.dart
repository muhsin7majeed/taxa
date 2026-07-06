import 'dart:convert';

class ClassifierLabelMap {
  const ClassifierLabelMap({required this.version, required this.labels});

  factory ClassifierLabelMap.fromJsonString(String source) {
    final decoded = jsonDecode(source);
    if (decoded is! Map<String, Object?>) {
      throw const FormatException('Label map root must be a JSON object.');
    }

    return ClassifierLabelMap.fromJson(decoded);
  }

  factory ClassifierLabelMap.fromJson(Map<String, Object?> json) {
    final version = json['version'];
    final labels = json['labels'];

    if (version is! String || version.isEmpty) {
      throw const FormatException('Label map version is required.');
    }

    if (labels is! List<Object?>) {
      throw const FormatException('Label map labels must be a JSON array.');
    }

    final parsedLabels = [
      for (final label in labels)
        if (label is Map<String, Object?>) ClassifierLabel.fromJson(label),
    ]..sort((a, b) => a.index.compareTo(b.index));

    if (parsedLabels.length != labels.length) {
      throw const FormatException('Each label must be a JSON object.');
    }

    return ClassifierLabelMap(version: version, labels: parsedLabels);
  }

  final String version;
  final List<ClassifierLabel> labels;

  ClassifierLabel? labelForIndex(int index) {
    for (final label in labels) {
      if (label.index == index) {
        return label;
      }
    }

    return null;
  }
}

class ClassifierLabel {
  const ClassifierLabel({
    required this.index,
    required this.taxonomyEntryId,
    required this.scientificName,
    required this.commonName,
  });

  factory ClassifierLabel.fromJson(Map<String, Object?> json) {
    final index = json['index'];
    final taxonomyEntryId = json['taxonomyEntryId'];
    final scientificName = json['scientificName'];
    final commonName = json['commonName'];

    if (index is! int || index < 0) {
      throw const FormatException(
        'Label index must be a non-negative integer.',
      );
    }

    if (taxonomyEntryId is! String || taxonomyEntryId.isEmpty) {
      throw const FormatException('Label taxonomyEntryId is required.');
    }

    if (scientificName is! String || scientificName.isEmpty) {
      throw const FormatException('Label scientificName is required.');
    }

    if (commonName is! String || commonName.isEmpty) {
      throw const FormatException('Label commonName is required.');
    }

    return ClassifierLabel(
      index: index,
      taxonomyEntryId: taxonomyEntryId,
      scientificName: scientificName,
      commonName: commonName,
    );
  }

  final int index;
  final String taxonomyEntryId;
  final String scientificName;
  final String commonName;
}
