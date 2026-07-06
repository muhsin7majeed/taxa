import '../../../core/storage/database/taxa_database.dart';
import '../../collection/data/local_catalog_repository.dart';
import '../domain/identification_outcome.dart';
import '../domain/identification_decision.dart';
import '../domain/image_classifier.dart';
import 'identification_attempt_repository.dart';

class IdentificationWorkflow {
  const IdentificationWorkflow({
    required this.classifier,
    required this.decisionPolicy,
    required this.attemptRepository,
    required this.catalogRepository,
  });

  final ImageClassifier classifier;
  final ConfidenceThresholdPolicy decisionPolicy;
  final IdentificationAttemptRepository attemptRepository;
  final LocalCatalogRepository catalogRepository;

  Future<PersistedIdentificationOutcome> identifyCapture(
    CaptureAttempt captureAttempt,
  ) async {
    await catalogRepository.ensureSeeded();

    final classification = await classifier.classifyImage(
      imagePath: captureAttempt.imagePath ?? '',
    );
    final decision = decisionPolicy.decide(classification);

    return attemptRepository.recordClassification(
      captureAttempt: captureAttempt,
      classification: classification,
      decision: decision,
    );
  }
}
