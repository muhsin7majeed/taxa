import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/storage/database/taxa_database.dart';

class CaptureAttemptRepository {
  CaptureAttemptRepository(this._database, {Uuid? uuid})
    : _uuid = uuid ?? const Uuid();

  final TaxaDatabase _database;
  final Uuid _uuid;

  Future<CaptureAttempt> recordCameraCapture({
    required String imagePath,
    required DateTime capturedAt,
    String? metadataJson,
  }) async {
    final now = DateTime.now().toUtc();
    final id = _uuid.v4();

    await _database
        .into(_database.captureAttempts)
        .insert(
          CaptureAttemptsCompanion.insert(
            id: id,
            capturedAt: capturedAt.toUtc(),
            imagePath: Value(imagePath),
            source: const Value('camera'),
            metadataJson: Value(metadataJson),
            createdAt: now,
            updatedAt: now,
          ),
        );

    return (_database.select(
      _database.captureAttempts,
    )..where((table) => table.id.equals(id))).getSingle();
  }
}
