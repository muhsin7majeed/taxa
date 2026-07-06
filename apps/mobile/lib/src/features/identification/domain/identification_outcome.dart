import '../../../core/storage/database/taxa_database.dart';
import 'identification_decision.dart';
import 'image_classifier.dart';

class PersistedIdentificationOutcome {
  const PersistedIdentificationOutcome({
    required this.classification,
    required this.decision,
    required this.attempt,
    required this.taxonomyEntry,
    required this.discovery,
  });

  final ImageClassification classification;
  final IdentificationDecision decision;
  final IdentificationAttempt attempt;
  final TaxonomyEntry? taxonomyEntry;
  final Discovery? discovery;

  bool get isIdentified {
    return decision.isIdentified && taxonomyEntry != null && discovery != null;
  }

  double? get topConfidence {
    return classification.topPrediction?.confidence;
  }
}
