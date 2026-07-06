import '../domain/classifier_label_map.dart';
import '../domain/image_classifier.dart';

class ClassifierOutputDecoder {
  const ClassifierOutputDecoder();

  List<ImageClassifierPrediction> decodeTopK({
    required List<double> scores,
    required ClassifierLabelMap labelMap,
    int topK = 3,
  }) {
    if (topK <= 0) {
      throw ArgumentError.value(topK, 'topK', 'Must be positive.');
    }

    final predictions = <ImageClassifierPrediction>[];
    for (var index = 0; index < scores.length; index += 1) {
      final label = labelMap.labelForIndex(index);
      if (label == null) {
        continue;
      }

      predictions.add(
        ImageClassifierPrediction(
          taxonomyEntryId: label.taxonomyEntryId,
          scientificName: label.scientificName,
          commonName: label.commonName,
          confidence: scores[index],
        ),
      );
    }

    predictions.sort((a, b) => b.confidence.compareTo(a.confidence));

    return predictions.take(topK).toList(growable: false);
  }
}
