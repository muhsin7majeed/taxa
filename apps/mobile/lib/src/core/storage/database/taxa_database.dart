import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'taxa_database.g.dart';

class TaxonomyEntries extends Table {
  TextColumn get id => text()();
  TextColumn get scientificName => text()();
  TextColumn get commonName => text()();
  TextColumn get category => text()();
  TextColumn get rarity => text()();
  TextColumn get habitat => text()();
  TextColumn get diet => text()();
  TextColumn get sizeDescription => text()();
  TextColumn get catalogVersion => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get syncRevision => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class ChecklistGroups extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get catalogVersion => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get syncRevision => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class ChecklistEntries extends Table {
  TextColumn get checklistGroupId => text().references(ChecklistGroups, #id)();
  TextColumn get taxonomyEntryId => text().references(TaxonomyEntries, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get syncRevision => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {checklistGroupId, taxonomyEntryId};
}

class CaptureAttempts extends Table {
  TextColumn get id => text()();
  DateTimeColumn get capturedAt => dateTime()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get source => text().withDefault(const Constant('camera'))();
  TextColumn get metadataJson => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get syncRevision => integer().withDefault(const Constant(0))();
  TextColumn get syncState => text().withDefault(const Constant('local'))();

  @override
  Set<Column> get primaryKey => {id};
}

class IdentificationAttempts extends Table {
  TextColumn get id => text()();
  TextColumn get captureAttemptId =>
      text().nullable().references(CaptureAttempts, #id)();
  TextColumn get taxonomyEntryId =>
      text().nullable().references(TaxonomyEntries, #id)();
  TextColumn get status => text()();
  TextColumn get modelVersion => text()();
  TextColumn get labelMapVersion => text()();
  RealColumn get threshold => real()();
  RealColumn get topConfidence => real().nullable()();
  TextColumn get topKJson => text().nullable()();
  DateTimeColumn get attemptedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get syncRevision => integer().withDefault(const Constant(0))();
  TextColumn get syncState => text().withDefault(const Constant('local'))();

  @override
  Set<Column> get primaryKey => {id};
}

class Discoveries extends Table {
  TextColumn get id => text()();
  TextColumn get taxonomyEntryId => text().references(TaxonomyEntries, #id)();
  TextColumn get captureAttemptId =>
      text().nullable().references(CaptureAttempts, #id)();
  TextColumn get identificationAttemptId =>
      text().nullable().references(IdentificationAttempts, #id)();
  DateTimeColumn get discoveredAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get syncRevision => integer().withDefault(const Constant(0))();
  TextColumn get syncState => text().withDefault(const Constant('local'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    TaxonomyEntries,
    ChecklistGroups,
    ChecklistEntries,
    CaptureAttempts,
    IdentificationAttempts,
    Discoveries,
  ],
)
class TaxaDatabase extends _$TaxaDatabase {
  TaxaDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'taxa_mobile'));

  @override
  int get schemaVersion => 1;
}
