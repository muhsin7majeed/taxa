import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/storage/database/taxa_database.dart';

void main() {
  test('TaxaDatabase starts at schema version 1', () {
    final database = TaxaDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    expect(database.schemaVersion, 1);
  });
}
