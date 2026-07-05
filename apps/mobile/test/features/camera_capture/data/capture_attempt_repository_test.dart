import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/database/taxa_database.dart';
import 'package:taxa_mobile/src/features/camera_capture/data/capture_attempt_repository.dart';

void main() {
  late TaxaDatabase database;
  late CaptureAttemptRepository repository;

  setUp(() {
    database = TaxaDatabase(NativeDatabase.memory());
    repository = CaptureAttemptRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test(
    'records camera capture attempts as local camera-sourced rows',
    () async {
      final capturedAt = DateTime.utc(2026, 7, 5, 12, 30);
      final metadata = jsonEncode({
        'source': 'camera',
        'cameraName': 'back',
        'lensDirection': 'back',
      });

      final attempt = await repository.recordCameraCapture(
        imagePath: 'app-support/captures/example.jpg',
        capturedAt: capturedAt,
        metadataJson: metadata,
      );

      expect(attempt.id, isNotEmpty);
      expect(attempt.imagePath, 'app-support/captures/example.jpg');
      expect(attempt.capturedAt.toUtc(), capturedAt);
      expect(attempt.source, 'camera');
      expect(attempt.metadataJson, metadata);
      expect(attempt.syncState, 'local');
      expect(attempt.syncRevision, 0);
    },
  );
}
