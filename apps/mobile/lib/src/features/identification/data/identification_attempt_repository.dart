import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/storage/database/taxa_database.dart';
import '../domain/identification_decision.dart';
import '../domain/identification_outcome.dart';
import '../domain/image_classifier.dart';

class IdentificationAttemptRepository {
  IdentificationAttemptRepository(this._database, {Uuid? uuid})
    : _uuid = uuid ?? const Uuid();

  final TaxaDatabase _database;
  final Uuid _uuid;

  Future<PersistedIdentificationOutcome> recordClassification({
    required CaptureAttempt captureAttempt,
    required ImageClassification classification,
    required IdentificationDecision decision,
    DateTime? attemptedAt,
  }) async {
    final now = (attemptedAt ?? DateTime.now()).toUtc();
    final acceptedPrediction = decision.acceptedPrediction;
    final taxonomyEntry = acceptedPrediction == null
        ? null
        : await _findTaxonomyEntry(acceptedPrediction.taxonomyEntryId);
    final isIdentified = decision.isIdentified && taxonomyEntry != null;
    final attemptId = _uuid.v4();
    final discoveryId = _uuid.v4();

    await _database.transaction(() async {
      await _database
          .into(_database.identificationAttempts)
          .insert(
            IdentificationAttemptsCompanion.insert(
              id: attemptId,
              captureAttemptId: Value(captureAttempt.id),
              taxonomyEntryId: Value(isIdentified ? taxonomyEntry.id : null),
              status: isIdentified
                  ? IdentificationStatus.identified.storageValue
                  : IdentificationStatus.unidentified.storageValue,
              modelVersion: classification.modelVersion,
              labelMapVersion: classification.labelMapVersion,
              threshold: decision.threshold,
              topConfidence: Value(classification.topPrediction?.confidence),
              topKJson: Value(_encodeTopK(classification.predictions)),
              attemptedAt: now,
              createdAt: now,
              updatedAt: now,
            ),
          );

      if (isIdentified) {
        await _database
            .into(_database.discoveries)
            .insert(
              DiscoveriesCompanion.insert(
                id: discoveryId,
                taxonomyEntryId: taxonomyEntry.id,
                captureAttemptId: Value(captureAttempt.id),
                identificationAttemptId: Value(attemptId),
                discoveredAt: now,
                createdAt: now,
                updatedAt: now,
              ),
            );
      }
    });

    final attempt = await (_database.select(
      _database.identificationAttempts,
    )..where((table) => table.id.equals(attemptId))).getSingle();
    final discovery = isIdentified
        ? await (_database.select(
            _database.discoveries,
          )..where((table) => table.id.equals(discoveryId))).getSingle()
        : null;

    return PersistedIdentificationOutcome(
      classification: classification,
      decision: decision,
      attempt: attempt,
      taxonomyEntry: isIdentified ? taxonomyEntry : null,
      discovery: discovery,
    );
  }

  Future<TaxonomyEntry?> _findTaxonomyEntry(String id) {
    return (_database.select(
      _database.taxonomyEntries,
    )..where((table) => table.id.equals(id))).getSingleOrNull();
  }

  String _encodeTopK(List<ImageClassifierPrediction> predictions) {
    return jsonEncode([
      for (final prediction in predictions) prediction.toJson(),
    ]);
  }
}
