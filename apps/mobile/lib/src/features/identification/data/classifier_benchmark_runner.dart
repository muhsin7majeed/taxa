import '../domain/classifier_benchmark.dart';
import '../domain/classifier_model_config.dart';
import '../domain/image_classifier.dart';

class ClassifierBenchmarkRunner {
  const ClassifierBenchmarkRunner({
    required this.classifier,
    required this.config,
  });

  final ImageClassifier classifier;
  final ClassifierModelConfig config;

  Future<ClassifierBenchmarkSummary> run({
    int iterations = 3,
    String imagePath = 'benchmark://debug-capture',
  }) async {
    if (iterations <= 0) {
      throw ArgumentError.value(iterations, 'iterations', 'Must be positive.');
    }

    final latencies = <Duration>[];
    ImageClassification? latestClassification;

    for (var i = 0; i < iterations; i += 1) {
      final stopwatch = Stopwatch()..start();
      latestClassification = await classifier.classifyImage(
        imagePath: imagePath,
      );
      stopwatch.stop();
      latencies.add(stopwatch.elapsed);
    }

    final totalMicroseconds = latencies.fold<int>(
      0,
      (sum, latency) => sum + latency.inMicroseconds,
    );
    final sortedLatencies = [...latencies]..sort();
    final classification = latestClassification!;

    return ClassifierBenchmarkSummary(
      config: config,
      runtimeLabel: classifier.runtimeType.toString(),
      modelVersion: classification.modelVersion,
      labelMapVersion: classification.labelMapVersion,
      iterations: iterations,
      averageLatency: Duration(
        microseconds: (totalMicroseconds / iterations).round(),
      ),
      fastestLatency: sortedLatencies.first,
      slowestLatency: sortedLatencies.last,
      topPrediction: classification.topPrediction,
      ranAt: DateTime.now().toUtc(),
    );
  }
}
