import 'image_classifier.dart';

enum IdentificationStatus { identified, unidentified }

extension IdentificationStatusStorage on IdentificationStatus {
  String get storageValue {
    return switch (this) {
      IdentificationStatus.identified => 'identified',
      IdentificationStatus.unidentified => 'unidentified',
    };
  }
}

class IdentificationDecision {
  const IdentificationDecision({
    required this.status,
    required this.threshold,
    required this.acceptedPrediction,
  });

  final IdentificationStatus status;
  final double threshold;
  final ImageClassifierPrediction? acceptedPrediction;

  bool get isIdentified => status == IdentificationStatus.identified;
}

class ConfidenceThresholdPolicy {
  const ConfidenceThresholdPolicy({required this.threshold});

  final double threshold;

  IdentificationDecision decide(ImageClassification classification) {
    final topPrediction = classification.topPrediction;
    if (topPrediction != null && topPrediction.confidence >= threshold) {
      return IdentificationDecision(
        status: IdentificationStatus.identified,
        threshold: threshold,
        acceptedPrediction: topPrediction,
      );
    }

    return IdentificationDecision(
      status: IdentificationStatus.unidentified,
      threshold: threshold,
      acceptedPrediction: null,
    );
  }
}
