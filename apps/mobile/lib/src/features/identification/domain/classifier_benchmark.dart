import 'classifier_model_config.dart';
import 'image_classifier.dart';

class ClassifierBenchmarkSummary {
  const ClassifierBenchmarkSummary({
    required this.config,
    required this.modelVersion,
    required this.labelMapVersion,
    required this.iterations,
    required this.averageLatency,
    required this.fastestLatency,
    required this.slowestLatency,
    required this.topPrediction,
    required this.ranAt,
  });

  final ClassifierModelConfig config;
  final String modelVersion;
  final String labelMapVersion;
  final int iterations;
  final Duration averageLatency;
  final Duration fastestLatency;
  final Duration slowestLatency;
  final ImageClassifierPrediction? topPrediction;
  final DateTime ranAt;
}
