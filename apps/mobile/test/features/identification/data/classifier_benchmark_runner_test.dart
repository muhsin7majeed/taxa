import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/features/identification/data/classifier_benchmark_runner.dart';
import 'package:taxa_mobile/src/features/identification/domain/classifier_model_config.dart';
import 'package:taxa_mobile/src/features/identification/domain/image_classifier.dart';

void main() {
  test(
    'runs active classifier and summarizes latency and top prediction',
    () async {
      final runner = ClassifierBenchmarkRunner(
        classifier: const FakeImageClassifier(latency: Duration.zero),
        config: ClassifierModelConfig.mvpPlaceholder(),
      );

      final summary = await runner.run(iterations: 2);

      expect(summary.iterations, 2);
      expect(summary.modelVersion, FakeImageClassifier.modelVersion);
      expect(summary.labelMapVersion, summary.config.labelMapVersion);
      expect(summary.averageLatency.inMicroseconds, greaterThanOrEqualTo(0));
      expect(summary.fastestLatency, lessThanOrEqualTo(summary.slowestLatency));
      expect(summary.topPrediction?.commonName, 'American Robin');
    },
  );

  test('rejects non-positive iteration counts', () {
    final runner = ClassifierBenchmarkRunner(
      classifier: const FakeImageClassifier(latency: Duration.zero),
      config: ClassifierModelConfig.mvpPlaceholder(),
    );

    expect(() => runner.run(iterations: 0), throwsArgumentError);
  });
}
