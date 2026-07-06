import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../collection/data/local_catalog_providers.dart';
import 'classifier_benchmark_runner.dart';
import '../domain/classifier_model_config.dart';
import '../domain/identification_decision.dart';
import '../domain/image_classifier.dart';
import 'identification_attempt_repository.dart';
import 'identification_workflow.dart';

final imageClassifierProvider = Provider<ImageClassifier>((ref) {
  return const FakeImageClassifier();
});

final classifierModelConfigProvider = Provider<ClassifierModelConfig>((ref) {
  return ClassifierModelConfig.mvpPlaceholder();
});

final confidenceThresholdProvider = Provider<double>((ref) {
  return ref.watch(classifierModelConfigProvider).threshold;
});

final confidenceThresholdPolicyProvider = Provider<ConfidenceThresholdPolicy>((
  ref,
) {
  return ConfidenceThresholdPolicy(
    threshold: ref.watch(confidenceThresholdProvider),
  );
});

final identificationAttemptRepositoryProvider =
    Provider<IdentificationAttemptRepository>((ref) {
      return IdentificationAttemptRepository(ref.watch(taxaDatabaseProvider));
    });

final identificationWorkflowProvider = Provider<IdentificationWorkflow>((ref) {
  return IdentificationWorkflow(
    classifier: ref.watch(imageClassifierProvider),
    decisionPolicy: ref.watch(confidenceThresholdPolicyProvider),
    attemptRepository: ref.watch(identificationAttemptRepositoryProvider),
    catalogRepository: ref.watch(localCatalogRepositoryProvider),
  );
});

final classifierBenchmarkRunnerProvider = Provider<ClassifierBenchmarkRunner>((
  ref,
) {
  return ClassifierBenchmarkRunner(
    classifier: ref.watch(imageClassifierProvider),
    config: ref.watch(classifierModelConfigProvider),
  );
});

final classifierBenchmarkProvider = FutureProvider.autoDispose((ref) {
  return ref.watch(classifierBenchmarkRunnerProvider).run();
});
