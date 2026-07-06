import '../../../core/storage/seed/taxa_seed_data.dart';

abstract interface class ImageClassifier {
  Future<ImageClassification> classifyImage({required String imagePath});
}

class ImageClassification {
  const ImageClassification({
    required this.modelVersion,
    required this.labelMapVersion,
    required this.predictions,
  });

  final String modelVersion;
  final String labelMapVersion;
  final List<ImageClassifierPrediction> predictions;

  ImageClassifierPrediction? get topPrediction {
    if (predictions.isEmpty) {
      return null;
    }

    return predictions.first;
  }
}

class ImageClassifierPrediction {
  const ImageClassifierPrediction({
    required this.taxonomyEntryId,
    required this.scientificName,
    required this.commonName,
    required this.confidence,
  });

  final String taxonomyEntryId;
  final String scientificName;
  final String commonName;
  final double confidence;

  Map<String, Object> toJson() {
    return {
      'taxonomyEntryId': taxonomyEntryId,
      'scientificName': scientificName,
      'commonName': commonName,
      'confidence': confidence,
    };
  }
}

class FakeImageClassifier implements ImageClassifier {
  const FakeImageClassifier({
    this.latency = const Duration(milliseconds: 650),
    this.predictions = _defaultPredictions,
  });

  static const modelVersion = 'fake-local-classifier-v1';

  static const _defaultPredictions = [
    ImageClassifierPrediction(
      taxonomyEntryId: SeedIds.americanRobin,
      scientificName: 'Turdus migratorius',
      commonName: 'American Robin',
      confidence: 0.87,
    ),
    ImageClassifierPrediction(
      taxonomyEntryId: SeedIds.houseSparrow,
      scientificName: 'Passer domesticus',
      commonName: 'House Sparrow',
      confidence: 0.08,
    ),
    ImageClassifierPrediction(
      taxonomyEntryId: SeedIds.monarchButterfly,
      scientificName: 'Danaus plexippus',
      commonName: 'Monarch Butterfly',
      confidence: 0.05,
    ),
  ];

  final Duration latency;
  final List<ImageClassifierPrediction> predictions;

  @override
  Future<ImageClassification> classifyImage({required String imagePath}) async {
    if (latency > Duration.zero) {
      await Future<void>.delayed(latency);
    }

    return ImageClassification(
      modelVersion: modelVersion,
      labelMapVersion: fakeCatalogVersion,
      predictions: predictions,
    );
  }
}
