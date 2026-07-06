import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/image_classifier.dart';
import 'identification_providers.dart';
import 'tflite_classifier_readiness_checker.dart';
import 'tflite_image_classifier.dart';

final tfliteImageClassifierProvider = Provider<ImageClassifier>((ref) {
  return TfliteImageClassifier(
    config: ref.watch(classifierModelConfigProvider),
  );
});

final tfliteClassifierReadinessCheckerProvider =
    Provider<TfliteClassifierReadinessChecker>((ref) {
      return TfliteClassifierReadinessChecker(
        config: ref.watch(classifierModelConfigProvider),
      );
    });

final tfliteClassifierReadinessProvider = FutureProvider.autoDispose((ref) {
  return ref.watch(tfliteClassifierReadinessCheckerProvider).check();
});
