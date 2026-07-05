// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxa_database.dart';

// ignore_for_file: type=lint
class $TaxonomyEntriesTable extends TaxonomyEntries
    with TableInfo<$TaxonomyEntriesTable, TaxonomyEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaxonomyEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scientificNameMeta = const VerificationMeta(
    'scientificName',
  );
  @override
  late final GeneratedColumn<String> scientificName = GeneratedColumn<String>(
    'scientific_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commonNameMeta = const VerificationMeta(
    'commonName',
  );
  @override
  late final GeneratedColumn<String> commonName = GeneratedColumn<String>(
    'common_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<String> rarity = GeneratedColumn<String>(
    'rarity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _habitatMeta = const VerificationMeta(
    'habitat',
  );
  @override
  late final GeneratedColumn<String> habitat = GeneratedColumn<String>(
    'habitat',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dietMeta = const VerificationMeta('diet');
  @override
  late final GeneratedColumn<String> diet = GeneratedColumn<String>(
    'diet',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeDescriptionMeta = const VerificationMeta(
    'sizeDescription',
  );
  @override
  late final GeneratedColumn<String> sizeDescription = GeneratedColumn<String>(
    'size_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _catalogVersionMeta = const VerificationMeta(
    'catalogVersion',
  );
  @override
  late final GeneratedColumn<String> catalogVersion = GeneratedColumn<String>(
    'catalog_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncRevisionMeta = const VerificationMeta(
    'syncRevision',
  );
  @override
  late final GeneratedColumn<int> syncRevision = GeneratedColumn<int>(
    'sync_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    scientificName,
    commonName,
    category,
    rarity,
    habitat,
    diet,
    sizeDescription,
    catalogVersion,
    sortOrder,
    createdAt,
    updatedAt,
    syncRevision,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'taxonomy_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaxonomyEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('scientific_name')) {
      context.handle(
        _scientificNameMeta,
        scientificName.isAcceptableOrUnknown(
          data['scientific_name']!,
          _scientificNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scientificNameMeta);
    }
    if (data.containsKey('common_name')) {
      context.handle(
        _commonNameMeta,
        commonName.isAcceptableOrUnknown(data['common_name']!, _commonNameMeta),
      );
    } else if (isInserting) {
      context.missing(_commonNameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('rarity')) {
      context.handle(
        _rarityMeta,
        rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta),
      );
    } else if (isInserting) {
      context.missing(_rarityMeta);
    }
    if (data.containsKey('habitat')) {
      context.handle(
        _habitatMeta,
        habitat.isAcceptableOrUnknown(data['habitat']!, _habitatMeta),
      );
    } else if (isInserting) {
      context.missing(_habitatMeta);
    }
    if (data.containsKey('diet')) {
      context.handle(
        _dietMeta,
        diet.isAcceptableOrUnknown(data['diet']!, _dietMeta),
      );
    } else if (isInserting) {
      context.missing(_dietMeta);
    }
    if (data.containsKey('size_description')) {
      context.handle(
        _sizeDescriptionMeta,
        sizeDescription.isAcceptableOrUnknown(
          data['size_description']!,
          _sizeDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sizeDescriptionMeta);
    }
    if (data.containsKey('catalog_version')) {
      context.handle(
        _catalogVersionMeta,
        catalogVersion.isAcceptableOrUnknown(
          data['catalog_version']!,
          _catalogVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_catalogVersionMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_revision')) {
      context.handle(
        _syncRevisionMeta,
        syncRevision.isAcceptableOrUnknown(
          data['sync_revision']!,
          _syncRevisionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaxonomyEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxonomyEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      scientificName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scientific_name'],
      )!,
      commonName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}common_name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      rarity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rarity'],
      )!,
      habitat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habitat'],
      )!,
      diet: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diet'],
      )!,
      sizeDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}size_description'],
      )!,
      catalogVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catalog_version'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_revision'],
      )!,
    );
  }

  @override
  $TaxonomyEntriesTable createAlias(String alias) {
    return $TaxonomyEntriesTable(attachedDatabase, alias);
  }
}

class TaxonomyEntry extends DataClass implements Insertable<TaxonomyEntry> {
  final String id;
  final String scientificName;
  final String commonName;
  final String category;
  final String rarity;
  final String habitat;
  final String diet;
  final String sizeDescription;
  final String catalogVersion;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int syncRevision;
  const TaxonomyEntry({
    required this.id,
    required this.scientificName,
    required this.commonName,
    required this.category,
    required this.rarity,
    required this.habitat,
    required this.diet,
    required this.sizeDescription,
    required this.catalogVersion,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.syncRevision,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['scientific_name'] = Variable<String>(scientificName);
    map['common_name'] = Variable<String>(commonName);
    map['category'] = Variable<String>(category);
    map['rarity'] = Variable<String>(rarity);
    map['habitat'] = Variable<String>(habitat);
    map['diet'] = Variable<String>(diet);
    map['size_description'] = Variable<String>(sizeDescription);
    map['catalog_version'] = Variable<String>(catalogVersion);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_revision'] = Variable<int>(syncRevision);
    return map;
  }

  TaxonomyEntriesCompanion toCompanion(bool nullToAbsent) {
    return TaxonomyEntriesCompanion(
      id: Value(id),
      scientificName: Value(scientificName),
      commonName: Value(commonName),
      category: Value(category),
      rarity: Value(rarity),
      habitat: Value(habitat),
      diet: Value(diet),
      sizeDescription: Value(sizeDescription),
      catalogVersion: Value(catalogVersion),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncRevision: Value(syncRevision),
    );
  }

  factory TaxonomyEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxonomyEntry(
      id: serializer.fromJson<String>(json['id']),
      scientificName: serializer.fromJson<String>(json['scientificName']),
      commonName: serializer.fromJson<String>(json['commonName']),
      category: serializer.fromJson<String>(json['category']),
      rarity: serializer.fromJson<String>(json['rarity']),
      habitat: serializer.fromJson<String>(json['habitat']),
      diet: serializer.fromJson<String>(json['diet']),
      sizeDescription: serializer.fromJson<String>(json['sizeDescription']),
      catalogVersion: serializer.fromJson<String>(json['catalogVersion']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncRevision: serializer.fromJson<int>(json['syncRevision']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'scientificName': serializer.toJson<String>(scientificName),
      'commonName': serializer.toJson<String>(commonName),
      'category': serializer.toJson<String>(category),
      'rarity': serializer.toJson<String>(rarity),
      'habitat': serializer.toJson<String>(habitat),
      'diet': serializer.toJson<String>(diet),
      'sizeDescription': serializer.toJson<String>(sizeDescription),
      'catalogVersion': serializer.toJson<String>(catalogVersion),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncRevision': serializer.toJson<int>(syncRevision),
    };
  }

  TaxonomyEntry copyWith({
    String? id,
    String? scientificName,
    String? commonName,
    String? category,
    String? rarity,
    String? habitat,
    String? diet,
    String? sizeDescription,
    String? catalogVersion,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? syncRevision,
  }) => TaxonomyEntry(
    id: id ?? this.id,
    scientificName: scientificName ?? this.scientificName,
    commonName: commonName ?? this.commonName,
    category: category ?? this.category,
    rarity: rarity ?? this.rarity,
    habitat: habitat ?? this.habitat,
    diet: diet ?? this.diet,
    sizeDescription: sizeDescription ?? this.sizeDescription,
    catalogVersion: catalogVersion ?? this.catalogVersion,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncRevision: syncRevision ?? this.syncRevision,
  );
  TaxonomyEntry copyWithCompanion(TaxonomyEntriesCompanion data) {
    return TaxonomyEntry(
      id: data.id.present ? data.id.value : this.id,
      scientificName: data.scientificName.present
          ? data.scientificName.value
          : this.scientificName,
      commonName: data.commonName.present
          ? data.commonName.value
          : this.commonName,
      category: data.category.present ? data.category.value : this.category,
      rarity: data.rarity.present ? data.rarity.value : this.rarity,
      habitat: data.habitat.present ? data.habitat.value : this.habitat,
      diet: data.diet.present ? data.diet.value : this.diet,
      sizeDescription: data.sizeDescription.present
          ? data.sizeDescription.value
          : this.sizeDescription,
      catalogVersion: data.catalogVersion.present
          ? data.catalogVersion.value
          : this.catalogVersion,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncRevision: data.syncRevision.present
          ? data.syncRevision.value
          : this.syncRevision,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxonomyEntry(')
          ..write('id: $id, ')
          ..write('scientificName: $scientificName, ')
          ..write('commonName: $commonName, ')
          ..write('category: $category, ')
          ..write('rarity: $rarity, ')
          ..write('habitat: $habitat, ')
          ..write('diet: $diet, ')
          ..write('sizeDescription: $sizeDescription, ')
          ..write('catalogVersion: $catalogVersion, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    scientificName,
    commonName,
    category,
    rarity,
    habitat,
    diet,
    sizeDescription,
    catalogVersion,
    sortOrder,
    createdAt,
    updatedAt,
    syncRevision,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxonomyEntry &&
          other.id == this.id &&
          other.scientificName == this.scientificName &&
          other.commonName == this.commonName &&
          other.category == this.category &&
          other.rarity == this.rarity &&
          other.habitat == this.habitat &&
          other.diet == this.diet &&
          other.sizeDescription == this.sizeDescription &&
          other.catalogVersion == this.catalogVersion &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncRevision == this.syncRevision);
}

class TaxonomyEntriesCompanion extends UpdateCompanion<TaxonomyEntry> {
  final Value<String> id;
  final Value<String> scientificName;
  final Value<String> commonName;
  final Value<String> category;
  final Value<String> rarity;
  final Value<String> habitat;
  final Value<String> diet;
  final Value<String> sizeDescription;
  final Value<String> catalogVersion;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> syncRevision;
  final Value<int> rowid;
  const TaxonomyEntriesCompanion({
    this.id = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.commonName = const Value.absent(),
    this.category = const Value.absent(),
    this.rarity = const Value.absent(),
    this.habitat = const Value.absent(),
    this.diet = const Value.absent(),
    this.sizeDescription = const Value.absent(),
    this.catalogVersion = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaxonomyEntriesCompanion.insert({
    required String id,
    required String scientificName,
    required String commonName,
    required String category,
    required String rarity,
    required String habitat,
    required String diet,
    required String sizeDescription,
    required String catalogVersion,
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       scientificName = Value(scientificName),
       commonName = Value(commonName),
       category = Value(category),
       rarity = Value(rarity),
       habitat = Value(habitat),
       diet = Value(diet),
       sizeDescription = Value(sizeDescription),
       catalogVersion = Value(catalogVersion),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TaxonomyEntry> custom({
    Expression<String>? id,
    Expression<String>? scientificName,
    Expression<String>? commonName,
    Expression<String>? category,
    Expression<String>? rarity,
    Expression<String>? habitat,
    Expression<String>? diet,
    Expression<String>? sizeDescription,
    Expression<String>? catalogVersion,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? syncRevision,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scientificName != null) 'scientific_name': scientificName,
      if (commonName != null) 'common_name': commonName,
      if (category != null) 'category': category,
      if (rarity != null) 'rarity': rarity,
      if (habitat != null) 'habitat': habitat,
      if (diet != null) 'diet': diet,
      if (sizeDescription != null) 'size_description': sizeDescription,
      if (catalogVersion != null) 'catalog_version': catalogVersion,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncRevision != null) 'sync_revision': syncRevision,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaxonomyEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? scientificName,
    Value<String>? commonName,
    Value<String>? category,
    Value<String>? rarity,
    Value<String>? habitat,
    Value<String>? diet,
    Value<String>? sizeDescription,
    Value<String>? catalogVersion,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? syncRevision,
    Value<int>? rowid,
  }) {
    return TaxonomyEntriesCompanion(
      id: id ?? this.id,
      scientificName: scientificName ?? this.scientificName,
      commonName: commonName ?? this.commonName,
      category: category ?? this.category,
      rarity: rarity ?? this.rarity,
      habitat: habitat ?? this.habitat,
      diet: diet ?? this.diet,
      sizeDescription: sizeDescription ?? this.sizeDescription,
      catalogVersion: catalogVersion ?? this.catalogVersion,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncRevision: syncRevision ?? this.syncRevision,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (scientificName.present) {
      map['scientific_name'] = Variable<String>(scientificName.value);
    }
    if (commonName.present) {
      map['common_name'] = Variable<String>(commonName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rarity.present) {
      map['rarity'] = Variable<String>(rarity.value);
    }
    if (habitat.present) {
      map['habitat'] = Variable<String>(habitat.value);
    }
    if (diet.present) {
      map['diet'] = Variable<String>(diet.value);
    }
    if (sizeDescription.present) {
      map['size_description'] = Variable<String>(sizeDescription.value);
    }
    if (catalogVersion.present) {
      map['catalog_version'] = Variable<String>(catalogVersion.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncRevision.present) {
      map['sync_revision'] = Variable<int>(syncRevision.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxonomyEntriesCompanion(')
          ..write('id: $id, ')
          ..write('scientificName: $scientificName, ')
          ..write('commonName: $commonName, ')
          ..write('category: $category, ')
          ..write('rarity: $rarity, ')
          ..write('habitat: $habitat, ')
          ..write('diet: $diet, ')
          ..write('sizeDescription: $sizeDescription, ')
          ..write('catalogVersion: $catalogVersion, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChecklistGroupsTable extends ChecklistGroups
    with TableInfo<$ChecklistGroupsTable, ChecklistGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _catalogVersionMeta = const VerificationMeta(
    'catalogVersion',
  );
  @override
  late final GeneratedColumn<String> catalogVersion = GeneratedColumn<String>(
    'catalog_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncRevisionMeta = const VerificationMeta(
    'syncRevision',
  );
  @override
  late final GeneratedColumn<int> syncRevision = GeneratedColumn<int>(
    'sync_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    catalogVersion,
    sortOrder,
    createdAt,
    updatedAt,
    syncRevision,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklist_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChecklistGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('catalog_version')) {
      context.handle(
        _catalogVersionMeta,
        catalogVersion.isAcceptableOrUnknown(
          data['catalog_version']!,
          _catalogVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_catalogVersionMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_revision')) {
      context.handle(
        _syncRevisionMeta,
        syncRevision.isAcceptableOrUnknown(
          data['sync_revision']!,
          _syncRevisionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChecklistGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistGroup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      catalogVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catalog_version'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_revision'],
      )!,
    );
  }

  @override
  $ChecklistGroupsTable createAlias(String alias) {
    return $ChecklistGroupsTable(attachedDatabase, alias);
  }
}

class ChecklistGroup extends DataClass implements Insertable<ChecklistGroup> {
  final String id;
  final String name;
  final String description;
  final String catalogVersion;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int syncRevision;
  const ChecklistGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.catalogVersion,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.syncRevision,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['catalog_version'] = Variable<String>(catalogVersion);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_revision'] = Variable<int>(syncRevision);
    return map;
  }

  ChecklistGroupsCompanion toCompanion(bool nullToAbsent) {
    return ChecklistGroupsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      catalogVersion: Value(catalogVersion),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncRevision: Value(syncRevision),
    );
  }

  factory ChecklistGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChecklistGroup(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      catalogVersion: serializer.fromJson<String>(json['catalogVersion']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncRevision: serializer.fromJson<int>(json['syncRevision']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'catalogVersion': serializer.toJson<String>(catalogVersion),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncRevision': serializer.toJson<int>(syncRevision),
    };
  }

  ChecklistGroup copyWith({
    String? id,
    String? name,
    String? description,
    String? catalogVersion,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? syncRevision,
  }) => ChecklistGroup(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    catalogVersion: catalogVersion ?? this.catalogVersion,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncRevision: syncRevision ?? this.syncRevision,
  );
  ChecklistGroup copyWithCompanion(ChecklistGroupsCompanion data) {
    return ChecklistGroup(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      catalogVersion: data.catalogVersion.present
          ? data.catalogVersion.value
          : this.catalogVersion,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncRevision: data.syncRevision.present
          ? data.syncRevision.value
          : this.syncRevision,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistGroup(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('catalogVersion: $catalogVersion, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    catalogVersion,
    sortOrder,
    createdAt,
    updatedAt,
    syncRevision,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChecklistGroup &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.catalogVersion == this.catalogVersion &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncRevision == this.syncRevision);
}

class ChecklistGroupsCompanion extends UpdateCompanion<ChecklistGroup> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> catalogVersion;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> syncRevision;
  final Value<int> rowid;
  const ChecklistGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.catalogVersion = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChecklistGroupsCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String catalogVersion,
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       catalogVersion = Value(catalogVersion),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ChecklistGroup> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? catalogVersion,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? syncRevision,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (catalogVersion != null) 'catalog_version': catalogVersion,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncRevision != null) 'sync_revision': syncRevision,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChecklistGroupsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? catalogVersion,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? syncRevision,
    Value<int>? rowid,
  }) {
    return ChecklistGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      catalogVersion: catalogVersion ?? this.catalogVersion,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncRevision: syncRevision ?? this.syncRevision,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (catalogVersion.present) {
      map['catalog_version'] = Variable<String>(catalogVersion.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncRevision.present) {
      map['sync_revision'] = Variable<int>(syncRevision.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('catalogVersion: $catalogVersion, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChecklistEntriesTable extends ChecklistEntries
    with TableInfo<$ChecklistEntriesTable, ChecklistEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _checklistGroupIdMeta = const VerificationMeta(
    'checklistGroupId',
  );
  @override
  late final GeneratedColumn<String> checklistGroupId = GeneratedColumn<String>(
    'checklist_group_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES checklist_groups (id)',
    ),
  );
  static const VerificationMeta _taxonomyEntryIdMeta = const VerificationMeta(
    'taxonomyEntryId',
  );
  @override
  late final GeneratedColumn<String> taxonomyEntryId = GeneratedColumn<String>(
    'taxonomy_entry_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES taxonomy_entries (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncRevisionMeta = const VerificationMeta(
    'syncRevision',
  );
  @override
  late final GeneratedColumn<int> syncRevision = GeneratedColumn<int>(
    'sync_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    checklistGroupId,
    taxonomyEntryId,
    createdAt,
    updatedAt,
    syncRevision,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklist_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChecklistEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('checklist_group_id')) {
      context.handle(
        _checklistGroupIdMeta,
        checklistGroupId.isAcceptableOrUnknown(
          data['checklist_group_id']!,
          _checklistGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_checklistGroupIdMeta);
    }
    if (data.containsKey('taxonomy_entry_id')) {
      context.handle(
        _taxonomyEntryIdMeta,
        taxonomyEntryId.isAcceptableOrUnknown(
          data['taxonomy_entry_id']!,
          _taxonomyEntryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_taxonomyEntryIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_revision')) {
      context.handle(
        _syncRevisionMeta,
        syncRevision.isAcceptableOrUnknown(
          data['sync_revision']!,
          _syncRevisionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {checklistGroupId, taxonomyEntryId};
  @override
  ChecklistEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistEntry(
      checklistGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checklist_group_id'],
      )!,
      taxonomyEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}taxonomy_entry_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_revision'],
      )!,
    );
  }

  @override
  $ChecklistEntriesTable createAlias(String alias) {
    return $ChecklistEntriesTable(attachedDatabase, alias);
  }
}

class ChecklistEntry extends DataClass implements Insertable<ChecklistEntry> {
  final String checklistGroupId;
  final String taxonomyEntryId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int syncRevision;
  const ChecklistEntry({
    required this.checklistGroupId,
    required this.taxonomyEntryId,
    required this.createdAt,
    required this.updatedAt,
    required this.syncRevision,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['checklist_group_id'] = Variable<String>(checklistGroupId);
    map['taxonomy_entry_id'] = Variable<String>(taxonomyEntryId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_revision'] = Variable<int>(syncRevision);
    return map;
  }

  ChecklistEntriesCompanion toCompanion(bool nullToAbsent) {
    return ChecklistEntriesCompanion(
      checklistGroupId: Value(checklistGroupId),
      taxonomyEntryId: Value(taxonomyEntryId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncRevision: Value(syncRevision),
    );
  }

  factory ChecklistEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChecklistEntry(
      checklistGroupId: serializer.fromJson<String>(json['checklistGroupId']),
      taxonomyEntryId: serializer.fromJson<String>(json['taxonomyEntryId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncRevision: serializer.fromJson<int>(json['syncRevision']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'checklistGroupId': serializer.toJson<String>(checklistGroupId),
      'taxonomyEntryId': serializer.toJson<String>(taxonomyEntryId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncRevision': serializer.toJson<int>(syncRevision),
    };
  }

  ChecklistEntry copyWith({
    String? checklistGroupId,
    String? taxonomyEntryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? syncRevision,
  }) => ChecklistEntry(
    checklistGroupId: checklistGroupId ?? this.checklistGroupId,
    taxonomyEntryId: taxonomyEntryId ?? this.taxonomyEntryId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncRevision: syncRevision ?? this.syncRevision,
  );
  ChecklistEntry copyWithCompanion(ChecklistEntriesCompanion data) {
    return ChecklistEntry(
      checklistGroupId: data.checklistGroupId.present
          ? data.checklistGroupId.value
          : this.checklistGroupId,
      taxonomyEntryId: data.taxonomyEntryId.present
          ? data.taxonomyEntryId.value
          : this.taxonomyEntryId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncRevision: data.syncRevision.present
          ? data.syncRevision.value
          : this.syncRevision,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistEntry(')
          ..write('checklistGroupId: $checklistGroupId, ')
          ..write('taxonomyEntryId: $taxonomyEntryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    checklistGroupId,
    taxonomyEntryId,
    createdAt,
    updatedAt,
    syncRevision,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChecklistEntry &&
          other.checklistGroupId == this.checklistGroupId &&
          other.taxonomyEntryId == this.taxonomyEntryId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncRevision == this.syncRevision);
}

class ChecklistEntriesCompanion extends UpdateCompanion<ChecklistEntry> {
  final Value<String> checklistGroupId;
  final Value<String> taxonomyEntryId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> syncRevision;
  final Value<int> rowid;
  const ChecklistEntriesCompanion({
    this.checklistGroupId = const Value.absent(),
    this.taxonomyEntryId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChecklistEntriesCompanion.insert({
    required String checklistGroupId,
    required String taxonomyEntryId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncRevision = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : checklistGroupId = Value(checklistGroupId),
       taxonomyEntryId = Value(taxonomyEntryId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ChecklistEntry> custom({
    Expression<String>? checklistGroupId,
    Expression<String>? taxonomyEntryId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? syncRevision,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (checklistGroupId != null) 'checklist_group_id': checklistGroupId,
      if (taxonomyEntryId != null) 'taxonomy_entry_id': taxonomyEntryId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncRevision != null) 'sync_revision': syncRevision,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChecklistEntriesCompanion copyWith({
    Value<String>? checklistGroupId,
    Value<String>? taxonomyEntryId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? syncRevision,
    Value<int>? rowid,
  }) {
    return ChecklistEntriesCompanion(
      checklistGroupId: checklistGroupId ?? this.checklistGroupId,
      taxonomyEntryId: taxonomyEntryId ?? this.taxonomyEntryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncRevision: syncRevision ?? this.syncRevision,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (checklistGroupId.present) {
      map['checklist_group_id'] = Variable<String>(checklistGroupId.value);
    }
    if (taxonomyEntryId.present) {
      map['taxonomy_entry_id'] = Variable<String>(taxonomyEntryId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncRevision.present) {
      map['sync_revision'] = Variable<int>(syncRevision.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistEntriesCompanion(')
          ..write('checklistGroupId: $checklistGroupId, ')
          ..write('taxonomyEntryId: $taxonomyEntryId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CaptureAttemptsTable extends CaptureAttempts
    with TableInfo<$CaptureAttemptsTable, CaptureAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaptureAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capturedAtMeta = const VerificationMeta(
    'capturedAt',
  );
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
    'captured_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('camera'),
  );
  static const VerificationMeta _metadataJsonMeta = const VerificationMeta(
    'metadataJson',
  );
  @override
  late final GeneratedColumn<String> metadataJson = GeneratedColumn<String>(
    'metadata_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncRevisionMeta = const VerificationMeta(
    'syncRevision',
  );
  @override
  late final GeneratedColumn<int> syncRevision = GeneratedColumn<int>(
    'sync_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    capturedAt,
    imagePath,
    source,
    metadataJson,
    createdAt,
    updatedAt,
    syncRevision,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'capture_attempts';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaptureAttempt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('captured_at')) {
      context.handle(
        _capturedAtMeta,
        capturedAt.isAcceptableOrUnknown(data['captured_at']!, _capturedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('metadata_json')) {
      context.handle(
        _metadataJsonMeta,
        metadataJson.isAcceptableOrUnknown(
          data['metadata_json']!,
          _metadataJsonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_revision')) {
      context.handle(
        _syncRevisionMeta,
        syncRevision.isAcceptableOrUnknown(
          data['sync_revision']!,
          _syncRevisionMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaptureAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaptureAttempt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      capturedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}captured_at'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      metadataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_revision'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $CaptureAttemptsTable createAlias(String alias) {
    return $CaptureAttemptsTable(attachedDatabase, alias);
  }
}

class CaptureAttempt extends DataClass implements Insertable<CaptureAttempt> {
  final String id;
  final DateTime capturedAt;
  final String? imagePath;
  final String source;
  final String? metadataJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int syncRevision;
  final String syncState;
  const CaptureAttempt({
    required this.id,
    required this.capturedAt,
    this.imagePath,
    required this.source,
    this.metadataJson,
    required this.createdAt,
    required this.updatedAt,
    required this.syncRevision,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['captured_at'] = Variable<DateTime>(capturedAt);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || metadataJson != null) {
      map['metadata_json'] = Variable<String>(metadataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_revision'] = Variable<int>(syncRevision);
    map['sync_state'] = Variable<String>(syncState);
    return map;
  }

  CaptureAttemptsCompanion toCompanion(bool nullToAbsent) {
    return CaptureAttemptsCompanion(
      id: Value(id),
      capturedAt: Value(capturedAt),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      source: Value(source),
      metadataJson: metadataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(metadataJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncRevision: Value(syncRevision),
      syncState: Value(syncState),
    );
  }

  factory CaptureAttempt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaptureAttempt(
      id: serializer.fromJson<String>(json['id']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      source: serializer.fromJson<String>(json['source']),
      metadataJson: serializer.fromJson<String?>(json['metadataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncRevision: serializer.fromJson<int>(json['syncRevision']),
      syncState: serializer.fromJson<String>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
      'imagePath': serializer.toJson<String?>(imagePath),
      'source': serializer.toJson<String>(source),
      'metadataJson': serializer.toJson<String?>(metadataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncRevision': serializer.toJson<int>(syncRevision),
      'syncState': serializer.toJson<String>(syncState),
    };
  }

  CaptureAttempt copyWith({
    String? id,
    DateTime? capturedAt,
    Value<String?> imagePath = const Value.absent(),
    String? source,
    Value<String?> metadataJson = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    int? syncRevision,
    String? syncState,
  }) => CaptureAttempt(
    id: id ?? this.id,
    capturedAt: capturedAt ?? this.capturedAt,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    source: source ?? this.source,
    metadataJson: metadataJson.present ? metadataJson.value : this.metadataJson,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncRevision: syncRevision ?? this.syncRevision,
    syncState: syncState ?? this.syncState,
  );
  CaptureAttempt copyWithCompanion(CaptureAttemptsCompanion data) {
    return CaptureAttempt(
      id: data.id.present ? data.id.value : this.id,
      capturedAt: data.capturedAt.present
          ? data.capturedAt.value
          : this.capturedAt,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      source: data.source.present ? data.source.value : this.source,
      metadataJson: data.metadataJson.present
          ? data.metadataJson.value
          : this.metadataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncRevision: data.syncRevision.present
          ? data.syncRevision.value
          : this.syncRevision,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaptureAttempt(')
          ..write('id: $id, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('imagePath: $imagePath, ')
          ..write('source: $source, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    capturedAt,
    imagePath,
    source,
    metadataJson,
    createdAt,
    updatedAt,
    syncRevision,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaptureAttempt &&
          other.id == this.id &&
          other.capturedAt == this.capturedAt &&
          other.imagePath == this.imagePath &&
          other.source == this.source &&
          other.metadataJson == this.metadataJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncRevision == this.syncRevision &&
          other.syncState == this.syncState);
}

class CaptureAttemptsCompanion extends UpdateCompanion<CaptureAttempt> {
  final Value<String> id;
  final Value<DateTime> capturedAt;
  final Value<String?> imagePath;
  final Value<String> source;
  final Value<String?> metadataJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> syncRevision;
  final Value<String> syncState;
  final Value<int> rowid;
  const CaptureAttemptsCompanion({
    this.id = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.source = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncRevision = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CaptureAttemptsCompanion.insert({
    required String id,
    required DateTime capturedAt,
    this.imagePath = const Value.absent(),
    this.source = const Value.absent(),
    this.metadataJson = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncRevision = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       capturedAt = Value(capturedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CaptureAttempt> custom({
    Expression<String>? id,
    Expression<DateTime>? capturedAt,
    Expression<String>? imagePath,
    Expression<String>? source,
    Expression<String>? metadataJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? syncRevision,
    Expression<String>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (imagePath != null) 'image_path': imagePath,
      if (source != null) 'source': source,
      if (metadataJson != null) 'metadata_json': metadataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncRevision != null) 'sync_revision': syncRevision,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CaptureAttemptsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? capturedAt,
    Value<String?>? imagePath,
    Value<String>? source,
    Value<String?>? metadataJson,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? syncRevision,
    Value<String>? syncState,
    Value<int>? rowid,
  }) {
    return CaptureAttemptsCompanion(
      id: id ?? this.id,
      capturedAt: capturedAt ?? this.capturedAt,
      imagePath: imagePath ?? this.imagePath,
      source: source ?? this.source,
      metadataJson: metadataJson ?? this.metadataJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncRevision: syncRevision ?? this.syncRevision,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (metadataJson.present) {
      map['metadata_json'] = Variable<String>(metadataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncRevision.present) {
      map['sync_revision'] = Variable<int>(syncRevision.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaptureAttemptsCompanion(')
          ..write('id: $id, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('imagePath: $imagePath, ')
          ..write('source: $source, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IdentificationAttemptsTable extends IdentificationAttempts
    with TableInfo<$IdentificationAttemptsTable, IdentificationAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IdentificationAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _captureAttemptIdMeta = const VerificationMeta(
    'captureAttemptId',
  );
  @override
  late final GeneratedColumn<String> captureAttemptId = GeneratedColumn<String>(
    'capture_attempt_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES capture_attempts (id)',
    ),
  );
  static const VerificationMeta _taxonomyEntryIdMeta = const VerificationMeta(
    'taxonomyEntryId',
  );
  @override
  late final GeneratedColumn<String> taxonomyEntryId = GeneratedColumn<String>(
    'taxonomy_entry_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES taxonomy_entries (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelVersionMeta = const VerificationMeta(
    'modelVersion',
  );
  @override
  late final GeneratedColumn<String> modelVersion = GeneratedColumn<String>(
    'model_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMapVersionMeta = const VerificationMeta(
    'labelMapVersion',
  );
  @override
  late final GeneratedColumn<String> labelMapVersion = GeneratedColumn<String>(
    'label_map_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thresholdMeta = const VerificationMeta(
    'threshold',
  );
  @override
  late final GeneratedColumn<double> threshold = GeneratedColumn<double>(
    'threshold',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topConfidenceMeta = const VerificationMeta(
    'topConfidence',
  );
  @override
  late final GeneratedColumn<double> topConfidence = GeneratedColumn<double>(
    'top_confidence',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _topKJsonMeta = const VerificationMeta(
    'topKJson',
  );
  @override
  late final GeneratedColumn<String> topKJson = GeneratedColumn<String>(
    'top_k_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attemptedAtMeta = const VerificationMeta(
    'attemptedAt',
  );
  @override
  late final GeneratedColumn<DateTime> attemptedAt = GeneratedColumn<DateTime>(
    'attempted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncRevisionMeta = const VerificationMeta(
    'syncRevision',
  );
  @override
  late final GeneratedColumn<int> syncRevision = GeneratedColumn<int>(
    'sync_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    captureAttemptId,
    taxonomyEntryId,
    status,
    modelVersion,
    labelMapVersion,
    threshold,
    topConfidence,
    topKJson,
    attemptedAt,
    createdAt,
    updatedAt,
    syncRevision,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'identification_attempts';
  @override
  VerificationContext validateIntegrity(
    Insertable<IdentificationAttempt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('capture_attempt_id')) {
      context.handle(
        _captureAttemptIdMeta,
        captureAttemptId.isAcceptableOrUnknown(
          data['capture_attempt_id']!,
          _captureAttemptIdMeta,
        ),
      );
    }
    if (data.containsKey('taxonomy_entry_id')) {
      context.handle(
        _taxonomyEntryIdMeta,
        taxonomyEntryId.isAcceptableOrUnknown(
          data['taxonomy_entry_id']!,
          _taxonomyEntryIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('model_version')) {
      context.handle(
        _modelVersionMeta,
        modelVersion.isAcceptableOrUnknown(
          data['model_version']!,
          _modelVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_modelVersionMeta);
    }
    if (data.containsKey('label_map_version')) {
      context.handle(
        _labelMapVersionMeta,
        labelMapVersion.isAcceptableOrUnknown(
          data['label_map_version']!,
          _labelMapVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_labelMapVersionMeta);
    }
    if (data.containsKey('threshold')) {
      context.handle(
        _thresholdMeta,
        threshold.isAcceptableOrUnknown(data['threshold']!, _thresholdMeta),
      );
    } else if (isInserting) {
      context.missing(_thresholdMeta);
    }
    if (data.containsKey('top_confidence')) {
      context.handle(
        _topConfidenceMeta,
        topConfidence.isAcceptableOrUnknown(
          data['top_confidence']!,
          _topConfidenceMeta,
        ),
      );
    }
    if (data.containsKey('top_k_json')) {
      context.handle(
        _topKJsonMeta,
        topKJson.isAcceptableOrUnknown(data['top_k_json']!, _topKJsonMeta),
      );
    }
    if (data.containsKey('attempted_at')) {
      context.handle(
        _attemptedAtMeta,
        attemptedAt.isAcceptableOrUnknown(
          data['attempted_at']!,
          _attemptedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_attemptedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_revision')) {
      context.handle(
        _syncRevisionMeta,
        syncRevision.isAcceptableOrUnknown(
          data['sync_revision']!,
          _syncRevisionMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IdentificationAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IdentificationAttempt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      captureAttemptId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}capture_attempt_id'],
      ),
      taxonomyEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}taxonomy_entry_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      modelVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_version'],
      )!,
      labelMapVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_map_version'],
      )!,
      threshold: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}threshold'],
      )!,
      topConfidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}top_confidence'],
      ),
      topKJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}top_k_json'],
      ),
      attemptedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}attempted_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_revision'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $IdentificationAttemptsTable createAlias(String alias) {
    return $IdentificationAttemptsTable(attachedDatabase, alias);
  }
}

class IdentificationAttempt extends DataClass
    implements Insertable<IdentificationAttempt> {
  final String id;
  final String? captureAttemptId;
  final String? taxonomyEntryId;
  final String status;
  final String modelVersion;
  final String labelMapVersion;
  final double threshold;
  final double? topConfidence;
  final String? topKJson;
  final DateTime attemptedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int syncRevision;
  final String syncState;
  const IdentificationAttempt({
    required this.id,
    this.captureAttemptId,
    this.taxonomyEntryId,
    required this.status,
    required this.modelVersion,
    required this.labelMapVersion,
    required this.threshold,
    this.topConfidence,
    this.topKJson,
    required this.attemptedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.syncRevision,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || captureAttemptId != null) {
      map['capture_attempt_id'] = Variable<String>(captureAttemptId);
    }
    if (!nullToAbsent || taxonomyEntryId != null) {
      map['taxonomy_entry_id'] = Variable<String>(taxonomyEntryId);
    }
    map['status'] = Variable<String>(status);
    map['model_version'] = Variable<String>(modelVersion);
    map['label_map_version'] = Variable<String>(labelMapVersion);
    map['threshold'] = Variable<double>(threshold);
    if (!nullToAbsent || topConfidence != null) {
      map['top_confidence'] = Variable<double>(topConfidence);
    }
    if (!nullToAbsent || topKJson != null) {
      map['top_k_json'] = Variable<String>(topKJson);
    }
    map['attempted_at'] = Variable<DateTime>(attemptedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_revision'] = Variable<int>(syncRevision);
    map['sync_state'] = Variable<String>(syncState);
    return map;
  }

  IdentificationAttemptsCompanion toCompanion(bool nullToAbsent) {
    return IdentificationAttemptsCompanion(
      id: Value(id),
      captureAttemptId: captureAttemptId == null && nullToAbsent
          ? const Value.absent()
          : Value(captureAttemptId),
      taxonomyEntryId: taxonomyEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(taxonomyEntryId),
      status: Value(status),
      modelVersion: Value(modelVersion),
      labelMapVersion: Value(labelMapVersion),
      threshold: Value(threshold),
      topConfidence: topConfidence == null && nullToAbsent
          ? const Value.absent()
          : Value(topConfidence),
      topKJson: topKJson == null && nullToAbsent
          ? const Value.absent()
          : Value(topKJson),
      attemptedAt: Value(attemptedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncRevision: Value(syncRevision),
      syncState: Value(syncState),
    );
  }

  factory IdentificationAttempt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IdentificationAttempt(
      id: serializer.fromJson<String>(json['id']),
      captureAttemptId: serializer.fromJson<String?>(json['captureAttemptId']),
      taxonomyEntryId: serializer.fromJson<String?>(json['taxonomyEntryId']),
      status: serializer.fromJson<String>(json['status']),
      modelVersion: serializer.fromJson<String>(json['modelVersion']),
      labelMapVersion: serializer.fromJson<String>(json['labelMapVersion']),
      threshold: serializer.fromJson<double>(json['threshold']),
      topConfidence: serializer.fromJson<double?>(json['topConfidence']),
      topKJson: serializer.fromJson<String?>(json['topKJson']),
      attemptedAt: serializer.fromJson<DateTime>(json['attemptedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncRevision: serializer.fromJson<int>(json['syncRevision']),
      syncState: serializer.fromJson<String>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'captureAttemptId': serializer.toJson<String?>(captureAttemptId),
      'taxonomyEntryId': serializer.toJson<String?>(taxonomyEntryId),
      'status': serializer.toJson<String>(status),
      'modelVersion': serializer.toJson<String>(modelVersion),
      'labelMapVersion': serializer.toJson<String>(labelMapVersion),
      'threshold': serializer.toJson<double>(threshold),
      'topConfidence': serializer.toJson<double?>(topConfidence),
      'topKJson': serializer.toJson<String?>(topKJson),
      'attemptedAt': serializer.toJson<DateTime>(attemptedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncRevision': serializer.toJson<int>(syncRevision),
      'syncState': serializer.toJson<String>(syncState),
    };
  }

  IdentificationAttempt copyWith({
    String? id,
    Value<String?> captureAttemptId = const Value.absent(),
    Value<String?> taxonomyEntryId = const Value.absent(),
    String? status,
    String? modelVersion,
    String? labelMapVersion,
    double? threshold,
    Value<double?> topConfidence = const Value.absent(),
    Value<String?> topKJson = const Value.absent(),
    DateTime? attemptedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? syncRevision,
    String? syncState,
  }) => IdentificationAttempt(
    id: id ?? this.id,
    captureAttemptId: captureAttemptId.present
        ? captureAttemptId.value
        : this.captureAttemptId,
    taxonomyEntryId: taxonomyEntryId.present
        ? taxonomyEntryId.value
        : this.taxonomyEntryId,
    status: status ?? this.status,
    modelVersion: modelVersion ?? this.modelVersion,
    labelMapVersion: labelMapVersion ?? this.labelMapVersion,
    threshold: threshold ?? this.threshold,
    topConfidence: topConfidence.present
        ? topConfidence.value
        : this.topConfidence,
    topKJson: topKJson.present ? topKJson.value : this.topKJson,
    attemptedAt: attemptedAt ?? this.attemptedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncRevision: syncRevision ?? this.syncRevision,
    syncState: syncState ?? this.syncState,
  );
  IdentificationAttempt copyWithCompanion(
    IdentificationAttemptsCompanion data,
  ) {
    return IdentificationAttempt(
      id: data.id.present ? data.id.value : this.id,
      captureAttemptId: data.captureAttemptId.present
          ? data.captureAttemptId.value
          : this.captureAttemptId,
      taxonomyEntryId: data.taxonomyEntryId.present
          ? data.taxonomyEntryId.value
          : this.taxonomyEntryId,
      status: data.status.present ? data.status.value : this.status,
      modelVersion: data.modelVersion.present
          ? data.modelVersion.value
          : this.modelVersion,
      labelMapVersion: data.labelMapVersion.present
          ? data.labelMapVersion.value
          : this.labelMapVersion,
      threshold: data.threshold.present ? data.threshold.value : this.threshold,
      topConfidence: data.topConfidence.present
          ? data.topConfidence.value
          : this.topConfidence,
      topKJson: data.topKJson.present ? data.topKJson.value : this.topKJson,
      attemptedAt: data.attemptedAt.present
          ? data.attemptedAt.value
          : this.attemptedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncRevision: data.syncRevision.present
          ? data.syncRevision.value
          : this.syncRevision,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IdentificationAttempt(')
          ..write('id: $id, ')
          ..write('captureAttemptId: $captureAttemptId, ')
          ..write('taxonomyEntryId: $taxonomyEntryId, ')
          ..write('status: $status, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('labelMapVersion: $labelMapVersion, ')
          ..write('threshold: $threshold, ')
          ..write('topConfidence: $topConfidence, ')
          ..write('topKJson: $topKJson, ')
          ..write('attemptedAt: $attemptedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    captureAttemptId,
    taxonomyEntryId,
    status,
    modelVersion,
    labelMapVersion,
    threshold,
    topConfidence,
    topKJson,
    attemptedAt,
    createdAt,
    updatedAt,
    syncRevision,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IdentificationAttempt &&
          other.id == this.id &&
          other.captureAttemptId == this.captureAttemptId &&
          other.taxonomyEntryId == this.taxonomyEntryId &&
          other.status == this.status &&
          other.modelVersion == this.modelVersion &&
          other.labelMapVersion == this.labelMapVersion &&
          other.threshold == this.threshold &&
          other.topConfidence == this.topConfidence &&
          other.topKJson == this.topKJson &&
          other.attemptedAt == this.attemptedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncRevision == this.syncRevision &&
          other.syncState == this.syncState);
}

class IdentificationAttemptsCompanion
    extends UpdateCompanion<IdentificationAttempt> {
  final Value<String> id;
  final Value<String?> captureAttemptId;
  final Value<String?> taxonomyEntryId;
  final Value<String> status;
  final Value<String> modelVersion;
  final Value<String> labelMapVersion;
  final Value<double> threshold;
  final Value<double?> topConfidence;
  final Value<String?> topKJson;
  final Value<DateTime> attemptedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> syncRevision;
  final Value<String> syncState;
  final Value<int> rowid;
  const IdentificationAttemptsCompanion({
    this.id = const Value.absent(),
    this.captureAttemptId = const Value.absent(),
    this.taxonomyEntryId = const Value.absent(),
    this.status = const Value.absent(),
    this.modelVersion = const Value.absent(),
    this.labelMapVersion = const Value.absent(),
    this.threshold = const Value.absent(),
    this.topConfidence = const Value.absent(),
    this.topKJson = const Value.absent(),
    this.attemptedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncRevision = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IdentificationAttemptsCompanion.insert({
    required String id,
    this.captureAttemptId = const Value.absent(),
    this.taxonomyEntryId = const Value.absent(),
    required String status,
    required String modelVersion,
    required String labelMapVersion,
    required double threshold,
    this.topConfidence = const Value.absent(),
    this.topKJson = const Value.absent(),
    required DateTime attemptedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncRevision = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       status = Value(status),
       modelVersion = Value(modelVersion),
       labelMapVersion = Value(labelMapVersion),
       threshold = Value(threshold),
       attemptedAt = Value(attemptedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<IdentificationAttempt> custom({
    Expression<String>? id,
    Expression<String>? captureAttemptId,
    Expression<String>? taxonomyEntryId,
    Expression<String>? status,
    Expression<String>? modelVersion,
    Expression<String>? labelMapVersion,
    Expression<double>? threshold,
    Expression<double>? topConfidence,
    Expression<String>? topKJson,
    Expression<DateTime>? attemptedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? syncRevision,
    Expression<String>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (captureAttemptId != null) 'capture_attempt_id': captureAttemptId,
      if (taxonomyEntryId != null) 'taxonomy_entry_id': taxonomyEntryId,
      if (status != null) 'status': status,
      if (modelVersion != null) 'model_version': modelVersion,
      if (labelMapVersion != null) 'label_map_version': labelMapVersion,
      if (threshold != null) 'threshold': threshold,
      if (topConfidence != null) 'top_confidence': topConfidence,
      if (topKJson != null) 'top_k_json': topKJson,
      if (attemptedAt != null) 'attempted_at': attemptedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncRevision != null) 'sync_revision': syncRevision,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IdentificationAttemptsCompanion copyWith({
    Value<String>? id,
    Value<String?>? captureAttemptId,
    Value<String?>? taxonomyEntryId,
    Value<String>? status,
    Value<String>? modelVersion,
    Value<String>? labelMapVersion,
    Value<double>? threshold,
    Value<double?>? topConfidence,
    Value<String?>? topKJson,
    Value<DateTime>? attemptedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? syncRevision,
    Value<String>? syncState,
    Value<int>? rowid,
  }) {
    return IdentificationAttemptsCompanion(
      id: id ?? this.id,
      captureAttemptId: captureAttemptId ?? this.captureAttemptId,
      taxonomyEntryId: taxonomyEntryId ?? this.taxonomyEntryId,
      status: status ?? this.status,
      modelVersion: modelVersion ?? this.modelVersion,
      labelMapVersion: labelMapVersion ?? this.labelMapVersion,
      threshold: threshold ?? this.threshold,
      topConfidence: topConfidence ?? this.topConfidence,
      topKJson: topKJson ?? this.topKJson,
      attemptedAt: attemptedAt ?? this.attemptedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncRevision: syncRevision ?? this.syncRevision,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (captureAttemptId.present) {
      map['capture_attempt_id'] = Variable<String>(captureAttemptId.value);
    }
    if (taxonomyEntryId.present) {
      map['taxonomy_entry_id'] = Variable<String>(taxonomyEntryId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (modelVersion.present) {
      map['model_version'] = Variable<String>(modelVersion.value);
    }
    if (labelMapVersion.present) {
      map['label_map_version'] = Variable<String>(labelMapVersion.value);
    }
    if (threshold.present) {
      map['threshold'] = Variable<double>(threshold.value);
    }
    if (topConfidence.present) {
      map['top_confidence'] = Variable<double>(topConfidence.value);
    }
    if (topKJson.present) {
      map['top_k_json'] = Variable<String>(topKJson.value);
    }
    if (attemptedAt.present) {
      map['attempted_at'] = Variable<DateTime>(attemptedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncRevision.present) {
      map['sync_revision'] = Variable<int>(syncRevision.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IdentificationAttemptsCompanion(')
          ..write('id: $id, ')
          ..write('captureAttemptId: $captureAttemptId, ')
          ..write('taxonomyEntryId: $taxonomyEntryId, ')
          ..write('status: $status, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('labelMapVersion: $labelMapVersion, ')
          ..write('threshold: $threshold, ')
          ..write('topConfidence: $topConfidence, ')
          ..write('topKJson: $topKJson, ')
          ..write('attemptedAt: $attemptedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DiscoveriesTable extends Discoveries
    with TableInfo<$DiscoveriesTable, Discovery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiscoveriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxonomyEntryIdMeta = const VerificationMeta(
    'taxonomyEntryId',
  );
  @override
  late final GeneratedColumn<String> taxonomyEntryId = GeneratedColumn<String>(
    'taxonomy_entry_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES taxonomy_entries (id)',
    ),
  );
  static const VerificationMeta _captureAttemptIdMeta = const VerificationMeta(
    'captureAttemptId',
  );
  @override
  late final GeneratedColumn<String> captureAttemptId = GeneratedColumn<String>(
    'capture_attempt_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES capture_attempts (id)',
    ),
  );
  static const VerificationMeta _identificationAttemptIdMeta =
      const VerificationMeta('identificationAttemptId');
  @override
  late final GeneratedColumn<String> identificationAttemptId =
      GeneratedColumn<String>(
        'identification_attempt_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES identification_attempts (id)',
        ),
      );
  static const VerificationMeta _discoveredAtMeta = const VerificationMeta(
    'discoveredAt',
  );
  @override
  late final GeneratedColumn<DateTime> discoveredAt = GeneratedColumn<DateTime>(
    'discovered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncRevisionMeta = const VerificationMeta(
    'syncRevision',
  );
  @override
  late final GeneratedColumn<int> syncRevision = GeneratedColumn<int>(
    'sync_revision',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    taxonomyEntryId,
    captureAttemptId,
    identificationAttemptId,
    discoveredAt,
    createdAt,
    updatedAt,
    syncRevision,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'discoveries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Discovery> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('taxonomy_entry_id')) {
      context.handle(
        _taxonomyEntryIdMeta,
        taxonomyEntryId.isAcceptableOrUnknown(
          data['taxonomy_entry_id']!,
          _taxonomyEntryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_taxonomyEntryIdMeta);
    }
    if (data.containsKey('capture_attempt_id')) {
      context.handle(
        _captureAttemptIdMeta,
        captureAttemptId.isAcceptableOrUnknown(
          data['capture_attempt_id']!,
          _captureAttemptIdMeta,
        ),
      );
    }
    if (data.containsKey('identification_attempt_id')) {
      context.handle(
        _identificationAttemptIdMeta,
        identificationAttemptId.isAcceptableOrUnknown(
          data['identification_attempt_id']!,
          _identificationAttemptIdMeta,
        ),
      );
    }
    if (data.containsKey('discovered_at')) {
      context.handle(
        _discoveredAtMeta,
        discoveredAt.isAcceptableOrUnknown(
          data['discovered_at']!,
          _discoveredAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_discoveredAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_revision')) {
      context.handle(
        _syncRevisionMeta,
        syncRevision.isAcceptableOrUnknown(
          data['sync_revision']!,
          _syncRevisionMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Discovery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Discovery(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      taxonomyEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}taxonomy_entry_id'],
      )!,
      captureAttemptId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}capture_attempt_id'],
      ),
      identificationAttemptId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identification_attempt_id'],
      ),
      discoveredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}discovered_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncRevision: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_revision'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $DiscoveriesTable createAlias(String alias) {
    return $DiscoveriesTable(attachedDatabase, alias);
  }
}

class Discovery extends DataClass implements Insertable<Discovery> {
  final String id;
  final String taxonomyEntryId;
  final String? captureAttemptId;
  final String? identificationAttemptId;
  final DateTime discoveredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int syncRevision;
  final String syncState;
  const Discovery({
    required this.id,
    required this.taxonomyEntryId,
    this.captureAttemptId,
    this.identificationAttemptId,
    required this.discoveredAt,
    required this.createdAt,
    required this.updatedAt,
    required this.syncRevision,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['taxonomy_entry_id'] = Variable<String>(taxonomyEntryId);
    if (!nullToAbsent || captureAttemptId != null) {
      map['capture_attempt_id'] = Variable<String>(captureAttemptId);
    }
    if (!nullToAbsent || identificationAttemptId != null) {
      map['identification_attempt_id'] = Variable<String>(
        identificationAttemptId,
      );
    }
    map['discovered_at'] = Variable<DateTime>(discoveredAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_revision'] = Variable<int>(syncRevision);
    map['sync_state'] = Variable<String>(syncState);
    return map;
  }

  DiscoveriesCompanion toCompanion(bool nullToAbsent) {
    return DiscoveriesCompanion(
      id: Value(id),
      taxonomyEntryId: Value(taxonomyEntryId),
      captureAttemptId: captureAttemptId == null && nullToAbsent
          ? const Value.absent()
          : Value(captureAttemptId),
      identificationAttemptId: identificationAttemptId == null && nullToAbsent
          ? const Value.absent()
          : Value(identificationAttemptId),
      discoveredAt: Value(discoveredAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncRevision: Value(syncRevision),
      syncState: Value(syncState),
    );
  }

  factory Discovery.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Discovery(
      id: serializer.fromJson<String>(json['id']),
      taxonomyEntryId: serializer.fromJson<String>(json['taxonomyEntryId']),
      captureAttemptId: serializer.fromJson<String?>(json['captureAttemptId']),
      identificationAttemptId: serializer.fromJson<String?>(
        json['identificationAttemptId'],
      ),
      discoveredAt: serializer.fromJson<DateTime>(json['discoveredAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncRevision: serializer.fromJson<int>(json['syncRevision']),
      syncState: serializer.fromJson<String>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'taxonomyEntryId': serializer.toJson<String>(taxonomyEntryId),
      'captureAttemptId': serializer.toJson<String?>(captureAttemptId),
      'identificationAttemptId': serializer.toJson<String?>(
        identificationAttemptId,
      ),
      'discoveredAt': serializer.toJson<DateTime>(discoveredAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncRevision': serializer.toJson<int>(syncRevision),
      'syncState': serializer.toJson<String>(syncState),
    };
  }

  Discovery copyWith({
    String? id,
    String? taxonomyEntryId,
    Value<String?> captureAttemptId = const Value.absent(),
    Value<String?> identificationAttemptId = const Value.absent(),
    DateTime? discoveredAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? syncRevision,
    String? syncState,
  }) => Discovery(
    id: id ?? this.id,
    taxonomyEntryId: taxonomyEntryId ?? this.taxonomyEntryId,
    captureAttemptId: captureAttemptId.present
        ? captureAttemptId.value
        : this.captureAttemptId,
    identificationAttemptId: identificationAttemptId.present
        ? identificationAttemptId.value
        : this.identificationAttemptId,
    discoveredAt: discoveredAt ?? this.discoveredAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncRevision: syncRevision ?? this.syncRevision,
    syncState: syncState ?? this.syncState,
  );
  Discovery copyWithCompanion(DiscoveriesCompanion data) {
    return Discovery(
      id: data.id.present ? data.id.value : this.id,
      taxonomyEntryId: data.taxonomyEntryId.present
          ? data.taxonomyEntryId.value
          : this.taxonomyEntryId,
      captureAttemptId: data.captureAttemptId.present
          ? data.captureAttemptId.value
          : this.captureAttemptId,
      identificationAttemptId: data.identificationAttemptId.present
          ? data.identificationAttemptId.value
          : this.identificationAttemptId,
      discoveredAt: data.discoveredAt.present
          ? data.discoveredAt.value
          : this.discoveredAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncRevision: data.syncRevision.present
          ? data.syncRevision.value
          : this.syncRevision,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Discovery(')
          ..write('id: $id, ')
          ..write('taxonomyEntryId: $taxonomyEntryId, ')
          ..write('captureAttemptId: $captureAttemptId, ')
          ..write('identificationAttemptId: $identificationAttemptId, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    taxonomyEntryId,
    captureAttemptId,
    identificationAttemptId,
    discoveredAt,
    createdAt,
    updatedAt,
    syncRevision,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Discovery &&
          other.id == this.id &&
          other.taxonomyEntryId == this.taxonomyEntryId &&
          other.captureAttemptId == this.captureAttemptId &&
          other.identificationAttemptId == this.identificationAttemptId &&
          other.discoveredAt == this.discoveredAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncRevision == this.syncRevision &&
          other.syncState == this.syncState);
}

class DiscoveriesCompanion extends UpdateCompanion<Discovery> {
  final Value<String> id;
  final Value<String> taxonomyEntryId;
  final Value<String?> captureAttemptId;
  final Value<String?> identificationAttemptId;
  final Value<DateTime> discoveredAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> syncRevision;
  final Value<String> syncState;
  final Value<int> rowid;
  const DiscoveriesCompanion({
    this.id = const Value.absent(),
    this.taxonomyEntryId = const Value.absent(),
    this.captureAttemptId = const Value.absent(),
    this.identificationAttemptId = const Value.absent(),
    this.discoveredAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncRevision = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiscoveriesCompanion.insert({
    required String id,
    required String taxonomyEntryId,
    this.captureAttemptId = const Value.absent(),
    this.identificationAttemptId = const Value.absent(),
    required DateTime discoveredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncRevision = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       taxonomyEntryId = Value(taxonomyEntryId),
       discoveredAt = Value(discoveredAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Discovery> custom({
    Expression<String>? id,
    Expression<String>? taxonomyEntryId,
    Expression<String>? captureAttemptId,
    Expression<String>? identificationAttemptId,
    Expression<DateTime>? discoveredAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? syncRevision,
    Expression<String>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taxonomyEntryId != null) 'taxonomy_entry_id': taxonomyEntryId,
      if (captureAttemptId != null) 'capture_attempt_id': captureAttemptId,
      if (identificationAttemptId != null)
        'identification_attempt_id': identificationAttemptId,
      if (discoveredAt != null) 'discovered_at': discoveredAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncRevision != null) 'sync_revision': syncRevision,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiscoveriesCompanion copyWith({
    Value<String>? id,
    Value<String>? taxonomyEntryId,
    Value<String?>? captureAttemptId,
    Value<String?>? identificationAttemptId,
    Value<DateTime>? discoveredAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? syncRevision,
    Value<String>? syncState,
    Value<int>? rowid,
  }) {
    return DiscoveriesCompanion(
      id: id ?? this.id,
      taxonomyEntryId: taxonomyEntryId ?? this.taxonomyEntryId,
      captureAttemptId: captureAttemptId ?? this.captureAttemptId,
      identificationAttemptId:
          identificationAttemptId ?? this.identificationAttemptId,
      discoveredAt: discoveredAt ?? this.discoveredAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncRevision: syncRevision ?? this.syncRevision,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (taxonomyEntryId.present) {
      map['taxonomy_entry_id'] = Variable<String>(taxonomyEntryId.value);
    }
    if (captureAttemptId.present) {
      map['capture_attempt_id'] = Variable<String>(captureAttemptId.value);
    }
    if (identificationAttemptId.present) {
      map['identification_attempt_id'] = Variable<String>(
        identificationAttemptId.value,
      );
    }
    if (discoveredAt.present) {
      map['discovered_at'] = Variable<DateTime>(discoveredAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncRevision.present) {
      map['sync_revision'] = Variable<int>(syncRevision.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiscoveriesCompanion(')
          ..write('id: $id, ')
          ..write('taxonomyEntryId: $taxonomyEntryId, ')
          ..write('captureAttemptId: $captureAttemptId, ')
          ..write('identificationAttemptId: $identificationAttemptId, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncRevision: $syncRevision, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$TaxaDatabase extends GeneratedDatabase {
  _$TaxaDatabase(QueryExecutor e) : super(e);
  $TaxaDatabaseManager get managers => $TaxaDatabaseManager(this);
  late final $TaxonomyEntriesTable taxonomyEntries = $TaxonomyEntriesTable(
    this,
  );
  late final $ChecklistGroupsTable checklistGroups = $ChecklistGroupsTable(
    this,
  );
  late final $ChecklistEntriesTable checklistEntries = $ChecklistEntriesTable(
    this,
  );
  late final $CaptureAttemptsTable captureAttempts = $CaptureAttemptsTable(
    this,
  );
  late final $IdentificationAttemptsTable identificationAttempts =
      $IdentificationAttemptsTable(this);
  late final $DiscoveriesTable discoveries = $DiscoveriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    taxonomyEntries,
    checklistGroups,
    checklistEntries,
    captureAttempts,
    identificationAttempts,
    discoveries,
  ];
}

typedef $$TaxonomyEntriesTableCreateCompanionBuilder =
    TaxonomyEntriesCompanion Function({
      required String id,
      required String scientificName,
      required String commonName,
      required String category,
      required String rarity,
      required String habitat,
      required String diet,
      required String sizeDescription,
      required String catalogVersion,
      Value<int> sortOrder,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> syncRevision,
      Value<int> rowid,
    });
typedef $$TaxonomyEntriesTableUpdateCompanionBuilder =
    TaxonomyEntriesCompanion Function({
      Value<String> id,
      Value<String> scientificName,
      Value<String> commonName,
      Value<String> category,
      Value<String> rarity,
      Value<String> habitat,
      Value<String> diet,
      Value<String> sizeDescription,
      Value<String> catalogVersion,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> syncRevision,
      Value<int> rowid,
    });

final class $$TaxonomyEntriesTableReferences
    extends
        BaseReferences<_$TaxaDatabase, $TaxonomyEntriesTable, TaxonomyEntry> {
  $$TaxonomyEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ChecklistEntriesTable, List<ChecklistEntry>>
  _checklistEntriesRefsTable(_$TaxaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.checklistEntries,
        aliasName: 'taxonomy_entries__id__checklist_entries__taxonomy_entry_id',
      );

  $$ChecklistEntriesTableProcessedTableManager get checklistEntriesRefs {
    final manager =
        $$ChecklistEntriesTableTableManager($_db, $_db.checklistEntries).filter(
          (f) => f.taxonomyEntryId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _checklistEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $IdentificationAttemptsTable,
    List<IdentificationAttempt>
  >
  _identificationAttemptsRefsTable(_$TaxaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.identificationAttempts,
        aliasName:
            'taxonomy_entries__id__identification_attempts__taxonomy_entry_id',
      );

  $$IdentificationAttemptsTableProcessedTableManager
  get identificationAttemptsRefs {
    final manager =
        $$IdentificationAttemptsTableTableManager(
          $_db,
          $_db.identificationAttempts,
        ).filter(
          (f) => f.taxonomyEntryId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _identificationAttemptsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DiscoveriesTable, List<Discovery>>
  _discoveriesRefsTable(_$TaxaDatabase db) => MultiTypedResultKey.fromTable(
    db.discoveries,
    aliasName: 'taxonomy_entries__id__discoveries__taxonomy_entry_id',
  );

  $$DiscoveriesTableProcessedTableManager get discoveriesRefs {
    final manager = $$DiscoveriesTableTableManager($_db, $_db.discoveries)
        .filter(
          (f) => f.taxonomyEntryId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_discoveriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TaxonomyEntriesTableFilterComposer
    extends Composer<_$TaxaDatabase, $TaxonomyEntriesTable> {
  $$TaxonomyEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commonName => $composableBuilder(
    column: $table.commonName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get habitat => $composableBuilder(
    column: $table.habitat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diet => $composableBuilder(
    column: $table.diet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sizeDescription => $composableBuilder(
    column: $table.sizeDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catalogVersion => $composableBuilder(
    column: $table.catalogVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> checklistEntriesRefs(
    Expression<bool> Function($$ChecklistEntriesTableFilterComposer f) f,
  ) {
    final $$ChecklistEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checklistEntries,
      getReferencedColumn: (t) => t.taxonomyEntryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistEntriesTableFilterComposer(
            $db: $db,
            $table: $db.checklistEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> identificationAttemptsRefs(
    Expression<bool> Function($$IdentificationAttemptsTableFilterComposer f) f,
  ) {
    final $$IdentificationAttemptsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.identificationAttempts,
          getReferencedColumn: (t) => t.taxonomyEntryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IdentificationAttemptsTableFilterComposer(
                $db: $db,
                $table: $db.identificationAttempts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> discoveriesRefs(
    Expression<bool> Function($$DiscoveriesTableFilterComposer f) f,
  ) {
    final $$DiscoveriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.discoveries,
      getReferencedColumn: (t) => t.taxonomyEntryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiscoveriesTableFilterComposer(
            $db: $db,
            $table: $db.discoveries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TaxonomyEntriesTableOrderingComposer
    extends Composer<_$TaxaDatabase, $TaxonomyEntriesTable> {
  $$TaxonomyEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commonName => $composableBuilder(
    column: $table.commonName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get habitat => $composableBuilder(
    column: $table.habitat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diet => $composableBuilder(
    column: $table.diet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sizeDescription => $composableBuilder(
    column: $table.sizeDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catalogVersion => $composableBuilder(
    column: $table.catalogVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaxonomyEntriesTableAnnotationComposer
    extends Composer<_$TaxaDatabase, $TaxonomyEntriesTable> {
  $$TaxonomyEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get scientificName => $composableBuilder(
    column: $table.scientificName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get commonName => $composableBuilder(
    column: $table.commonName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get rarity =>
      $composableBuilder(column: $table.rarity, builder: (column) => column);

  GeneratedColumn<String> get habitat =>
      $composableBuilder(column: $table.habitat, builder: (column) => column);

  GeneratedColumn<String> get diet =>
      $composableBuilder(column: $table.diet, builder: (column) => column);

  GeneratedColumn<String> get sizeDescription => $composableBuilder(
    column: $table.sizeDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get catalogVersion => $composableBuilder(
    column: $table.catalogVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => column,
  );

  Expression<T> checklistEntriesRefs<T extends Object>(
    Expression<T> Function($$ChecklistEntriesTableAnnotationComposer a) f,
  ) {
    final $$ChecklistEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checklistEntries,
      getReferencedColumn: (t) => t.taxonomyEntryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.checklistEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> identificationAttemptsRefs<T extends Object>(
    Expression<T> Function($$IdentificationAttemptsTableAnnotationComposer a) f,
  ) {
    final $$IdentificationAttemptsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.identificationAttempts,
          getReferencedColumn: (t) => t.taxonomyEntryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IdentificationAttemptsTableAnnotationComposer(
                $db: $db,
                $table: $db.identificationAttempts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> discoveriesRefs<T extends Object>(
    Expression<T> Function($$DiscoveriesTableAnnotationComposer a) f,
  ) {
    final $$DiscoveriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.discoveries,
      getReferencedColumn: (t) => t.taxonomyEntryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiscoveriesTableAnnotationComposer(
            $db: $db,
            $table: $db.discoveries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TaxonomyEntriesTableTableManager
    extends
        RootTableManager<
          _$TaxaDatabase,
          $TaxonomyEntriesTable,
          TaxonomyEntry,
          $$TaxonomyEntriesTableFilterComposer,
          $$TaxonomyEntriesTableOrderingComposer,
          $$TaxonomyEntriesTableAnnotationComposer,
          $$TaxonomyEntriesTableCreateCompanionBuilder,
          $$TaxonomyEntriesTableUpdateCompanionBuilder,
          (TaxonomyEntry, $$TaxonomyEntriesTableReferences),
          TaxonomyEntry,
          PrefetchHooks Function({
            bool checklistEntriesRefs,
            bool identificationAttemptsRefs,
            bool discoveriesRefs,
          })
        > {
  $$TaxonomyEntriesTableTableManager(
    _$TaxaDatabase db,
    $TaxonomyEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaxonomyEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaxonomyEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaxonomyEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> scientificName = const Value.absent(),
                Value<String> commonName = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> rarity = const Value.absent(),
                Value<String> habitat = const Value.absent(),
                Value<String> diet = const Value.absent(),
                Value<String> sizeDescription = const Value.absent(),
                Value<String> catalogVersion = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> syncRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaxonomyEntriesCompanion(
                id: id,
                scientificName: scientificName,
                commonName: commonName,
                category: category,
                rarity: rarity,
                habitat: habitat,
                diet: diet,
                sizeDescription: sizeDescription,
                catalogVersion: catalogVersion,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String scientificName,
                required String commonName,
                required String category,
                required String rarity,
                required String habitat,
                required String diet,
                required String sizeDescription,
                required String catalogVersion,
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> syncRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaxonomyEntriesCompanion.insert(
                id: id,
                scientificName: scientificName,
                commonName: commonName,
                category: category,
                rarity: rarity,
                habitat: habitat,
                diet: diet,
                sizeDescription: sizeDescription,
                catalogVersion: catalogVersion,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TaxonomyEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                checklistEntriesRefs = false,
                identificationAttemptsRefs = false,
                discoveriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (checklistEntriesRefs) db.checklistEntries,
                    if (identificationAttemptsRefs) db.identificationAttempts,
                    if (discoveriesRefs) db.discoveries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (checklistEntriesRefs)
                        await $_getPrefetchedData<
                          TaxonomyEntry,
                          $TaxonomyEntriesTable,
                          ChecklistEntry
                        >(
                          currentTable: table,
                          referencedTable: $$TaxonomyEntriesTableReferences
                              ._checklistEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TaxonomyEntriesTableReferences(
                                db,
                                table,
                                p0,
                              ).checklistEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.taxonomyEntryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (identificationAttemptsRefs)
                        await $_getPrefetchedData<
                          TaxonomyEntry,
                          $TaxonomyEntriesTable,
                          IdentificationAttempt
                        >(
                          currentTable: table,
                          referencedTable: $$TaxonomyEntriesTableReferences
                              ._identificationAttemptsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TaxonomyEntriesTableReferences(
                                db,
                                table,
                                p0,
                              ).identificationAttemptsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.taxonomyEntryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (discoveriesRefs)
                        await $_getPrefetchedData<
                          TaxonomyEntry,
                          $TaxonomyEntriesTable,
                          Discovery
                        >(
                          currentTable: table,
                          referencedTable: $$TaxonomyEntriesTableReferences
                              ._discoveriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TaxonomyEntriesTableReferences(
                                db,
                                table,
                                p0,
                              ).discoveriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.taxonomyEntryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TaxonomyEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$TaxaDatabase,
      $TaxonomyEntriesTable,
      TaxonomyEntry,
      $$TaxonomyEntriesTableFilterComposer,
      $$TaxonomyEntriesTableOrderingComposer,
      $$TaxonomyEntriesTableAnnotationComposer,
      $$TaxonomyEntriesTableCreateCompanionBuilder,
      $$TaxonomyEntriesTableUpdateCompanionBuilder,
      (TaxonomyEntry, $$TaxonomyEntriesTableReferences),
      TaxonomyEntry,
      PrefetchHooks Function({
        bool checklistEntriesRefs,
        bool identificationAttemptsRefs,
        bool discoveriesRefs,
      })
    >;
typedef $$ChecklistGroupsTableCreateCompanionBuilder =
    ChecklistGroupsCompanion Function({
      required String id,
      required String name,
      required String description,
      required String catalogVersion,
      Value<int> sortOrder,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> syncRevision,
      Value<int> rowid,
    });
typedef $$ChecklistGroupsTableUpdateCompanionBuilder =
    ChecklistGroupsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<String> catalogVersion,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> syncRevision,
      Value<int> rowid,
    });

final class $$ChecklistGroupsTableReferences
    extends
        BaseReferences<_$TaxaDatabase, $ChecklistGroupsTable, ChecklistGroup> {
  $$ChecklistGroupsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ChecklistEntriesTable, List<ChecklistEntry>>
  _checklistEntriesRefsTable(_$TaxaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.checklistEntries,
        aliasName:
            'checklist_groups__id__checklist_entries__checklist_group_id',
      );

  $$ChecklistEntriesTableProcessedTableManager get checklistEntriesRefs {
    final manager =
        $$ChecklistEntriesTableTableManager($_db, $_db.checklistEntries).filter(
          (f) => f.checklistGroupId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _checklistEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChecklistGroupsTableFilterComposer
    extends Composer<_$TaxaDatabase, $ChecklistGroupsTable> {
  $$ChecklistGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catalogVersion => $composableBuilder(
    column: $table.catalogVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> checklistEntriesRefs(
    Expression<bool> Function($$ChecklistEntriesTableFilterComposer f) f,
  ) {
    final $$ChecklistEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checklistEntries,
      getReferencedColumn: (t) => t.checklistGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistEntriesTableFilterComposer(
            $db: $db,
            $table: $db.checklistEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChecklistGroupsTableOrderingComposer
    extends Composer<_$TaxaDatabase, $ChecklistGroupsTable> {
  $$ChecklistGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catalogVersion => $composableBuilder(
    column: $table.catalogVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChecklistGroupsTableAnnotationComposer
    extends Composer<_$TaxaDatabase, $ChecklistGroupsTable> {
  $$ChecklistGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get catalogVersion => $composableBuilder(
    column: $table.catalogVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => column,
  );

  Expression<T> checklistEntriesRefs<T extends Object>(
    Expression<T> Function($$ChecklistEntriesTableAnnotationComposer a) f,
  ) {
    final $$ChecklistEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checklistEntries,
      getReferencedColumn: (t) => t.checklistGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.checklistEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChecklistGroupsTableTableManager
    extends
        RootTableManager<
          _$TaxaDatabase,
          $ChecklistGroupsTable,
          ChecklistGroup,
          $$ChecklistGroupsTableFilterComposer,
          $$ChecklistGroupsTableOrderingComposer,
          $$ChecklistGroupsTableAnnotationComposer,
          $$ChecklistGroupsTableCreateCompanionBuilder,
          $$ChecklistGroupsTableUpdateCompanionBuilder,
          (ChecklistGroup, $$ChecklistGroupsTableReferences),
          ChecklistGroup,
          PrefetchHooks Function({bool checklistEntriesRefs})
        > {
  $$ChecklistGroupsTableTableManager(
    _$TaxaDatabase db,
    $ChecklistGroupsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChecklistGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChecklistGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChecklistGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> catalogVersion = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> syncRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistGroupsCompanion(
                id: id,
                name: name,
                description: description,
                catalogVersion: catalogVersion,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                required String catalogVersion,
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> syncRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistGroupsCompanion.insert(
                id: id,
                name: name,
                description: description,
                catalogVersion: catalogVersion,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChecklistGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({checklistEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (checklistEntriesRefs) db.checklistEntries,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (checklistEntriesRefs)
                    await $_getPrefetchedData<
                      ChecklistGroup,
                      $ChecklistGroupsTable,
                      ChecklistEntry
                    >(
                      currentTable: table,
                      referencedTable: $$ChecklistGroupsTableReferences
                          ._checklistEntriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ChecklistGroupsTableReferences(
                            db,
                            table,
                            p0,
                          ).checklistEntriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.checklistGroupId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChecklistGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$TaxaDatabase,
      $ChecklistGroupsTable,
      ChecklistGroup,
      $$ChecklistGroupsTableFilterComposer,
      $$ChecklistGroupsTableOrderingComposer,
      $$ChecklistGroupsTableAnnotationComposer,
      $$ChecklistGroupsTableCreateCompanionBuilder,
      $$ChecklistGroupsTableUpdateCompanionBuilder,
      (ChecklistGroup, $$ChecklistGroupsTableReferences),
      ChecklistGroup,
      PrefetchHooks Function({bool checklistEntriesRefs})
    >;
typedef $$ChecklistEntriesTableCreateCompanionBuilder =
    ChecklistEntriesCompanion Function({
      required String checklistGroupId,
      required String taxonomyEntryId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> syncRevision,
      Value<int> rowid,
    });
typedef $$ChecklistEntriesTableUpdateCompanionBuilder =
    ChecklistEntriesCompanion Function({
      Value<String> checklistGroupId,
      Value<String> taxonomyEntryId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> syncRevision,
      Value<int> rowid,
    });

final class $$ChecklistEntriesTableReferences
    extends
        BaseReferences<_$TaxaDatabase, $ChecklistEntriesTable, ChecklistEntry> {
  $$ChecklistEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ChecklistGroupsTable _checklistGroupIdTable(_$TaxaDatabase db) =>
      db.checklistGroups.createAlias(
        'checklist_entries__checklist_group_id__checklist_groups__id',
      );

  $$ChecklistGroupsTableProcessedTableManager get checklistGroupId {
    final $_column = $_itemColumn<String>('checklist_group_id')!;

    final manager = $$ChecklistGroupsTableTableManager(
      $_db,
      $_db.checklistGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_checklistGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TaxonomyEntriesTable _taxonomyEntryIdTable(_$TaxaDatabase db) =>
      db.taxonomyEntries.createAlias(
        'checklist_entries__taxonomy_entry_id__taxonomy_entries__id',
      );

  $$TaxonomyEntriesTableProcessedTableManager get taxonomyEntryId {
    final $_column = $_itemColumn<String>('taxonomy_entry_id')!;

    final manager = $$TaxonomyEntriesTableTableManager(
      $_db,
      $_db.taxonomyEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taxonomyEntryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChecklistEntriesTableFilterComposer
    extends Composer<_$TaxaDatabase, $ChecklistEntriesTable> {
  $$ChecklistEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnFilters(column),
  );

  $$ChecklistGroupsTableFilterComposer get checklistGroupId {
    final $$ChecklistGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checklistGroupId,
      referencedTable: $db.checklistGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistGroupsTableFilterComposer(
            $db: $db,
            $table: $db.checklistGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxonomyEntriesTableFilterComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableFilterComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistEntriesTableOrderingComposer
    extends Composer<_$TaxaDatabase, $ChecklistEntriesTable> {
  $$ChecklistEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChecklistGroupsTableOrderingComposer get checklistGroupId {
    final $$ChecklistGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checklistGroupId,
      referencedTable: $db.checklistGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.checklistGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxonomyEntriesTableOrderingComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistEntriesTableAnnotationComposer
    extends Composer<_$TaxaDatabase, $ChecklistEntriesTable> {
  $$ChecklistEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => column,
  );

  $$ChecklistGroupsTableAnnotationComposer get checklistGroupId {
    final $$ChecklistGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.checklistGroupId,
      referencedTable: $db.checklistGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.checklistGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxonomyEntriesTableAnnotationComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistEntriesTableTableManager
    extends
        RootTableManager<
          _$TaxaDatabase,
          $ChecklistEntriesTable,
          ChecklistEntry,
          $$ChecklistEntriesTableFilterComposer,
          $$ChecklistEntriesTableOrderingComposer,
          $$ChecklistEntriesTableAnnotationComposer,
          $$ChecklistEntriesTableCreateCompanionBuilder,
          $$ChecklistEntriesTableUpdateCompanionBuilder,
          (ChecklistEntry, $$ChecklistEntriesTableReferences),
          ChecklistEntry,
          PrefetchHooks Function({bool checklistGroupId, bool taxonomyEntryId})
        > {
  $$ChecklistEntriesTableTableManager(
    _$TaxaDatabase db,
    $ChecklistEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChecklistEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChecklistEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChecklistEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> checklistGroupId = const Value.absent(),
                Value<String> taxonomyEntryId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> syncRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistEntriesCompanion(
                checklistGroupId: checklistGroupId,
                taxonomyEntryId: taxonomyEntryId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String checklistGroupId,
                required String taxonomyEntryId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> syncRevision = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistEntriesCompanion.insert(
                checklistGroupId: checklistGroupId,
                taxonomyEntryId: taxonomyEntryId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChecklistEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({checklistGroupId = false, taxonomyEntryId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (checklistGroupId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.checklistGroupId,
                                    referencedTable:
                                        $$ChecklistEntriesTableReferences
                                            ._checklistGroupIdTable(db),
                                    referencedColumn:
                                        $$ChecklistEntriesTableReferences
                                            ._checklistGroupIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (taxonomyEntryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.taxonomyEntryId,
                                    referencedTable:
                                        $$ChecklistEntriesTableReferences
                                            ._taxonomyEntryIdTable(db),
                                    referencedColumn:
                                        $$ChecklistEntriesTableReferences
                                            ._taxonomyEntryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ChecklistEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$TaxaDatabase,
      $ChecklistEntriesTable,
      ChecklistEntry,
      $$ChecklistEntriesTableFilterComposer,
      $$ChecklistEntriesTableOrderingComposer,
      $$ChecklistEntriesTableAnnotationComposer,
      $$ChecklistEntriesTableCreateCompanionBuilder,
      $$ChecklistEntriesTableUpdateCompanionBuilder,
      (ChecklistEntry, $$ChecklistEntriesTableReferences),
      ChecklistEntry,
      PrefetchHooks Function({bool checklistGroupId, bool taxonomyEntryId})
    >;
typedef $$CaptureAttemptsTableCreateCompanionBuilder =
    CaptureAttemptsCompanion Function({
      required String id,
      required DateTime capturedAt,
      Value<String?> imagePath,
      Value<String> source,
      Value<String?> metadataJson,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> syncRevision,
      Value<String> syncState,
      Value<int> rowid,
    });
typedef $$CaptureAttemptsTableUpdateCompanionBuilder =
    CaptureAttemptsCompanion Function({
      Value<String> id,
      Value<DateTime> capturedAt,
      Value<String?> imagePath,
      Value<String> source,
      Value<String?> metadataJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> syncRevision,
      Value<String> syncState,
      Value<int> rowid,
    });

final class $$CaptureAttemptsTableReferences
    extends
        BaseReferences<_$TaxaDatabase, $CaptureAttemptsTable, CaptureAttempt> {
  $$CaptureAttemptsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $IdentificationAttemptsTable,
    List<IdentificationAttempt>
  >
  _identificationAttemptsRefsTable(_$TaxaDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.identificationAttempts,
        aliasName:
            'capture_attempts__id__identification_attempts__capture_attempt_id',
      );

  $$IdentificationAttemptsTableProcessedTableManager
  get identificationAttemptsRefs {
    final manager =
        $$IdentificationAttemptsTableTableManager(
          $_db,
          $_db.identificationAttempts,
        ).filter(
          (f) => f.captureAttemptId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _identificationAttemptsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DiscoveriesTable, List<Discovery>>
  _discoveriesRefsTable(_$TaxaDatabase db) => MultiTypedResultKey.fromTable(
    db.discoveries,
    aliasName: 'capture_attempts__id__discoveries__capture_attempt_id',
  );

  $$DiscoveriesTableProcessedTableManager get discoveriesRefs {
    final manager = $$DiscoveriesTableTableManager($_db, $_db.discoveries)
        .filter(
          (f) => f.captureAttemptId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_discoveriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CaptureAttemptsTableFilterComposer
    extends Composer<_$TaxaDatabase, $CaptureAttemptsTable> {
  $$CaptureAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> identificationAttemptsRefs(
    Expression<bool> Function($$IdentificationAttemptsTableFilterComposer f) f,
  ) {
    final $$IdentificationAttemptsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.identificationAttempts,
          getReferencedColumn: (t) => t.captureAttemptId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IdentificationAttemptsTableFilterComposer(
                $db: $db,
                $table: $db.identificationAttempts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> discoveriesRefs(
    Expression<bool> Function($$DiscoveriesTableFilterComposer f) f,
  ) {
    final $$DiscoveriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.discoveries,
      getReferencedColumn: (t) => t.captureAttemptId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiscoveriesTableFilterComposer(
            $db: $db,
            $table: $db.discoveries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CaptureAttemptsTableOrderingComposer
    extends Composer<_$TaxaDatabase, $CaptureAttemptsTable> {
  $$CaptureAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CaptureAttemptsTableAnnotationComposer
    extends Composer<_$TaxaDatabase, $CaptureAttemptsTable> {
  $$CaptureAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  Expression<T> identificationAttemptsRefs<T extends Object>(
    Expression<T> Function($$IdentificationAttemptsTableAnnotationComposer a) f,
  ) {
    final $$IdentificationAttemptsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.identificationAttempts,
          getReferencedColumn: (t) => t.captureAttemptId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IdentificationAttemptsTableAnnotationComposer(
                $db: $db,
                $table: $db.identificationAttempts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> discoveriesRefs<T extends Object>(
    Expression<T> Function($$DiscoveriesTableAnnotationComposer a) f,
  ) {
    final $$DiscoveriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.discoveries,
      getReferencedColumn: (t) => t.captureAttemptId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiscoveriesTableAnnotationComposer(
            $db: $db,
            $table: $db.discoveries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CaptureAttemptsTableTableManager
    extends
        RootTableManager<
          _$TaxaDatabase,
          $CaptureAttemptsTable,
          CaptureAttempt,
          $$CaptureAttemptsTableFilterComposer,
          $$CaptureAttemptsTableOrderingComposer,
          $$CaptureAttemptsTableAnnotationComposer,
          $$CaptureAttemptsTableCreateCompanionBuilder,
          $$CaptureAttemptsTableUpdateCompanionBuilder,
          (CaptureAttempt, $$CaptureAttemptsTableReferences),
          CaptureAttempt,
          PrefetchHooks Function({
            bool identificationAttemptsRefs,
            bool discoveriesRefs,
          })
        > {
  $$CaptureAttemptsTableTableManager(
    _$TaxaDatabase db,
    $CaptureAttemptsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaptureAttemptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaptureAttemptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaptureAttemptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> capturedAt = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> metadataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> syncRevision = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CaptureAttemptsCompanion(
                id: id,
                capturedAt: capturedAt,
                imagePath: imagePath,
                source: source,
                metadataJson: metadataJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime capturedAt,
                Value<String?> imagePath = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> metadataJson = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> syncRevision = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CaptureAttemptsCompanion.insert(
                id: id,
                capturedAt: capturedAt,
                imagePath: imagePath,
                source: source,
                metadataJson: metadataJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CaptureAttemptsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({identificationAttemptsRefs = false, discoveriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (identificationAttemptsRefs) db.identificationAttempts,
                    if (discoveriesRefs) db.discoveries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (identificationAttemptsRefs)
                        await $_getPrefetchedData<
                          CaptureAttempt,
                          $CaptureAttemptsTable,
                          IdentificationAttempt
                        >(
                          currentTable: table,
                          referencedTable: $$CaptureAttemptsTableReferences
                              ._identificationAttemptsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CaptureAttemptsTableReferences(
                                db,
                                table,
                                p0,
                              ).identificationAttemptsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.captureAttemptId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (discoveriesRefs)
                        await $_getPrefetchedData<
                          CaptureAttempt,
                          $CaptureAttemptsTable,
                          Discovery
                        >(
                          currentTable: table,
                          referencedTable: $$CaptureAttemptsTableReferences
                              ._discoveriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CaptureAttemptsTableReferences(
                                db,
                                table,
                                p0,
                              ).discoveriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.captureAttemptId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CaptureAttemptsTableProcessedTableManager =
    ProcessedTableManager<
      _$TaxaDatabase,
      $CaptureAttemptsTable,
      CaptureAttempt,
      $$CaptureAttemptsTableFilterComposer,
      $$CaptureAttemptsTableOrderingComposer,
      $$CaptureAttemptsTableAnnotationComposer,
      $$CaptureAttemptsTableCreateCompanionBuilder,
      $$CaptureAttemptsTableUpdateCompanionBuilder,
      (CaptureAttempt, $$CaptureAttemptsTableReferences),
      CaptureAttempt,
      PrefetchHooks Function({
        bool identificationAttemptsRefs,
        bool discoveriesRefs,
      })
    >;
typedef $$IdentificationAttemptsTableCreateCompanionBuilder =
    IdentificationAttemptsCompanion Function({
      required String id,
      Value<String?> captureAttemptId,
      Value<String?> taxonomyEntryId,
      required String status,
      required String modelVersion,
      required String labelMapVersion,
      required double threshold,
      Value<double?> topConfidence,
      Value<String?> topKJson,
      required DateTime attemptedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> syncRevision,
      Value<String> syncState,
      Value<int> rowid,
    });
typedef $$IdentificationAttemptsTableUpdateCompanionBuilder =
    IdentificationAttemptsCompanion Function({
      Value<String> id,
      Value<String?> captureAttemptId,
      Value<String?> taxonomyEntryId,
      Value<String> status,
      Value<String> modelVersion,
      Value<String> labelMapVersion,
      Value<double> threshold,
      Value<double?> topConfidence,
      Value<String?> topKJson,
      Value<DateTime> attemptedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> syncRevision,
      Value<String> syncState,
      Value<int> rowid,
    });

final class $$IdentificationAttemptsTableReferences
    extends
        BaseReferences<
          _$TaxaDatabase,
          $IdentificationAttemptsTable,
          IdentificationAttempt
        > {
  $$IdentificationAttemptsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CaptureAttemptsTable _captureAttemptIdTable(_$TaxaDatabase db) =>
      db.captureAttempts.createAlias(
        'identification_attempts__capture_attempt_id__capture_attempts__id',
      );

  $$CaptureAttemptsTableProcessedTableManager? get captureAttemptId {
    final $_column = $_itemColumn<String>('capture_attempt_id');
    if ($_column == null) return null;
    final manager = $$CaptureAttemptsTableTableManager(
      $_db,
      $_db.captureAttempts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_captureAttemptIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TaxonomyEntriesTable _taxonomyEntryIdTable(_$TaxaDatabase db) =>
      db.taxonomyEntries.createAlias(
        'identification_attempts__taxonomy_entry_id__taxonomy_entries__id',
      );

  $$TaxonomyEntriesTableProcessedTableManager? get taxonomyEntryId {
    final $_column = $_itemColumn<String>('taxonomy_entry_id');
    if ($_column == null) return null;
    final manager = $$TaxonomyEntriesTableTableManager(
      $_db,
      $_db.taxonomyEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taxonomyEntryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DiscoveriesTable, List<Discovery>>
  _discoveriesRefsTable(_$TaxaDatabase db) => MultiTypedResultKey.fromTable(
    db.discoveries,
    aliasName:
        'identification_attempts__id__discoveries__identification_attempt_id',
  );

  $$DiscoveriesTableProcessedTableManager get discoveriesRefs {
    final manager = $$DiscoveriesTableTableManager($_db, $_db.discoveries)
        .filter(
          (f) => f.identificationAttemptId.id.sqlEquals(
            $_itemColumn<String>('id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_discoveriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IdentificationAttemptsTableFilterComposer
    extends Composer<_$TaxaDatabase, $IdentificationAttemptsTable> {
  $$IdentificationAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labelMapVersion => $composableBuilder(
    column: $table.labelMapVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get threshold => $composableBuilder(
    column: $table.threshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get topConfidence => $composableBuilder(
    column: $table.topConfidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topKJson => $composableBuilder(
    column: $table.topKJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get attemptedAt => $composableBuilder(
    column: $table.attemptedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$CaptureAttemptsTableFilterComposer get captureAttemptId {
    final $$CaptureAttemptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.captureAttemptId,
      referencedTable: $db.captureAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaptureAttemptsTableFilterComposer(
            $db: $db,
            $table: $db.captureAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxonomyEntriesTableFilterComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableFilterComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> discoveriesRefs(
    Expression<bool> Function($$DiscoveriesTableFilterComposer f) f,
  ) {
    final $$DiscoveriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.discoveries,
      getReferencedColumn: (t) => t.identificationAttemptId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiscoveriesTableFilterComposer(
            $db: $db,
            $table: $db.discoveries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IdentificationAttemptsTableOrderingComposer
    extends Composer<_$TaxaDatabase, $IdentificationAttemptsTable> {
  $$IdentificationAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labelMapVersion => $composableBuilder(
    column: $table.labelMapVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get threshold => $composableBuilder(
    column: $table.threshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get topConfidence => $composableBuilder(
    column: $table.topConfidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topKJson => $composableBuilder(
    column: $table.topKJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get attemptedAt => $composableBuilder(
    column: $table.attemptedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$CaptureAttemptsTableOrderingComposer get captureAttemptId {
    final $$CaptureAttemptsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.captureAttemptId,
      referencedTable: $db.captureAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaptureAttemptsTableOrderingComposer(
            $db: $db,
            $table: $db.captureAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxonomyEntriesTableOrderingComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IdentificationAttemptsTableAnnotationComposer
    extends Composer<_$TaxaDatabase, $IdentificationAttemptsTable> {
  $$IdentificationAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get labelMapVersion => $composableBuilder(
    column: $table.labelMapVersion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get threshold =>
      $composableBuilder(column: $table.threshold, builder: (column) => column);

  GeneratedColumn<double> get topConfidence => $composableBuilder(
    column: $table.topConfidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get topKJson =>
      $composableBuilder(column: $table.topKJson, builder: (column) => column);

  GeneratedColumn<DateTime> get attemptedAt => $composableBuilder(
    column: $table.attemptedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$CaptureAttemptsTableAnnotationComposer get captureAttemptId {
    final $$CaptureAttemptsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.captureAttemptId,
      referencedTable: $db.captureAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaptureAttemptsTableAnnotationComposer(
            $db: $db,
            $table: $db.captureAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxonomyEntriesTableAnnotationComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> discoveriesRefs<T extends Object>(
    Expression<T> Function($$DiscoveriesTableAnnotationComposer a) f,
  ) {
    final $$DiscoveriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.discoveries,
      getReferencedColumn: (t) => t.identificationAttemptId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiscoveriesTableAnnotationComposer(
            $db: $db,
            $table: $db.discoveries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IdentificationAttemptsTableTableManager
    extends
        RootTableManager<
          _$TaxaDatabase,
          $IdentificationAttemptsTable,
          IdentificationAttempt,
          $$IdentificationAttemptsTableFilterComposer,
          $$IdentificationAttemptsTableOrderingComposer,
          $$IdentificationAttemptsTableAnnotationComposer,
          $$IdentificationAttemptsTableCreateCompanionBuilder,
          $$IdentificationAttemptsTableUpdateCompanionBuilder,
          (IdentificationAttempt, $$IdentificationAttemptsTableReferences),
          IdentificationAttempt,
          PrefetchHooks Function({
            bool captureAttemptId,
            bool taxonomyEntryId,
            bool discoveriesRefs,
          })
        > {
  $$IdentificationAttemptsTableTableManager(
    _$TaxaDatabase db,
    $IdentificationAttemptsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IdentificationAttemptsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$IdentificationAttemptsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$IdentificationAttemptsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> captureAttemptId = const Value.absent(),
                Value<String?> taxonomyEntryId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> modelVersion = const Value.absent(),
                Value<String> labelMapVersion = const Value.absent(),
                Value<double> threshold = const Value.absent(),
                Value<double?> topConfidence = const Value.absent(),
                Value<String?> topKJson = const Value.absent(),
                Value<DateTime> attemptedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> syncRevision = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IdentificationAttemptsCompanion(
                id: id,
                captureAttemptId: captureAttemptId,
                taxonomyEntryId: taxonomyEntryId,
                status: status,
                modelVersion: modelVersion,
                labelMapVersion: labelMapVersion,
                threshold: threshold,
                topConfidence: topConfidence,
                topKJson: topKJson,
                attemptedAt: attemptedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> captureAttemptId = const Value.absent(),
                Value<String?> taxonomyEntryId = const Value.absent(),
                required String status,
                required String modelVersion,
                required String labelMapVersion,
                required double threshold,
                Value<double?> topConfidence = const Value.absent(),
                Value<String?> topKJson = const Value.absent(),
                required DateTime attemptedAt,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> syncRevision = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IdentificationAttemptsCompanion.insert(
                id: id,
                captureAttemptId: captureAttemptId,
                taxonomyEntryId: taxonomyEntryId,
                status: status,
                modelVersion: modelVersion,
                labelMapVersion: labelMapVersion,
                threshold: threshold,
                topConfidence: topConfidence,
                topKJson: topKJson,
                attemptedAt: attemptedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IdentificationAttemptsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                captureAttemptId = false,
                taxonomyEntryId = false,
                discoveriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (discoveriesRefs) db.discoveries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (captureAttemptId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.captureAttemptId,
                                    referencedTable:
                                        $$IdentificationAttemptsTableReferences
                                            ._captureAttemptIdTable(db),
                                    referencedColumn:
                                        $$IdentificationAttemptsTableReferences
                                            ._captureAttemptIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (taxonomyEntryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.taxonomyEntryId,
                                    referencedTable:
                                        $$IdentificationAttemptsTableReferences
                                            ._taxonomyEntryIdTable(db),
                                    referencedColumn:
                                        $$IdentificationAttemptsTableReferences
                                            ._taxonomyEntryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (discoveriesRefs)
                        await $_getPrefetchedData<
                          IdentificationAttempt,
                          $IdentificationAttemptsTable,
                          Discovery
                        >(
                          currentTable: table,
                          referencedTable:
                              $$IdentificationAttemptsTableReferences
                                  ._discoveriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IdentificationAttemptsTableReferences(
                                db,
                                table,
                                p0,
                              ).discoveriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.identificationAttemptId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IdentificationAttemptsTableProcessedTableManager =
    ProcessedTableManager<
      _$TaxaDatabase,
      $IdentificationAttemptsTable,
      IdentificationAttempt,
      $$IdentificationAttemptsTableFilterComposer,
      $$IdentificationAttemptsTableOrderingComposer,
      $$IdentificationAttemptsTableAnnotationComposer,
      $$IdentificationAttemptsTableCreateCompanionBuilder,
      $$IdentificationAttemptsTableUpdateCompanionBuilder,
      (IdentificationAttempt, $$IdentificationAttemptsTableReferences),
      IdentificationAttempt,
      PrefetchHooks Function({
        bool captureAttemptId,
        bool taxonomyEntryId,
        bool discoveriesRefs,
      })
    >;
typedef $$DiscoveriesTableCreateCompanionBuilder =
    DiscoveriesCompanion Function({
      required String id,
      required String taxonomyEntryId,
      Value<String?> captureAttemptId,
      Value<String?> identificationAttemptId,
      required DateTime discoveredAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> syncRevision,
      Value<String> syncState,
      Value<int> rowid,
    });
typedef $$DiscoveriesTableUpdateCompanionBuilder =
    DiscoveriesCompanion Function({
      Value<String> id,
      Value<String> taxonomyEntryId,
      Value<String?> captureAttemptId,
      Value<String?> identificationAttemptId,
      Value<DateTime> discoveredAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> syncRevision,
      Value<String> syncState,
      Value<int> rowid,
    });

final class $$DiscoveriesTableReferences
    extends BaseReferences<_$TaxaDatabase, $DiscoveriesTable, Discovery> {
  $$DiscoveriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TaxonomyEntriesTable _taxonomyEntryIdTable(_$TaxaDatabase db) => db
      .taxonomyEntries
      .createAlias('discoveries__taxonomy_entry_id__taxonomy_entries__id');

  $$TaxonomyEntriesTableProcessedTableManager get taxonomyEntryId {
    final $_column = $_itemColumn<String>('taxonomy_entry_id')!;

    final manager = $$TaxonomyEntriesTableTableManager(
      $_db,
      $_db.taxonomyEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taxonomyEntryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CaptureAttemptsTable _captureAttemptIdTable(_$TaxaDatabase db) => db
      .captureAttempts
      .createAlias('discoveries__capture_attempt_id__capture_attempts__id');

  $$CaptureAttemptsTableProcessedTableManager? get captureAttemptId {
    final $_column = $_itemColumn<String>('capture_attempt_id');
    if ($_column == null) return null;
    final manager = $$CaptureAttemptsTableTableManager(
      $_db,
      $_db.captureAttempts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_captureAttemptIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IdentificationAttemptsTable _identificationAttemptIdTable(
    _$TaxaDatabase db,
  ) => db.identificationAttempts.createAlias(
    'discoveries__identification_attempt_id__identification_attempts__id',
  );

  $$IdentificationAttemptsTableProcessedTableManager?
  get identificationAttemptId {
    final $_column = $_itemColumn<String>('identification_attempt_id');
    if ($_column == null) return null;
    final manager = $$IdentificationAttemptsTableTableManager(
      $_db,
      $_db.identificationAttempts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _identificationAttemptIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DiscoveriesTableFilterComposer
    extends Composer<_$TaxaDatabase, $DiscoveriesTable> {
  $$DiscoveriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  $$TaxonomyEntriesTableFilterComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableFilterComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CaptureAttemptsTableFilterComposer get captureAttemptId {
    final $$CaptureAttemptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.captureAttemptId,
      referencedTable: $db.captureAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaptureAttemptsTableFilterComposer(
            $db: $db,
            $table: $db.captureAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IdentificationAttemptsTableFilterComposer get identificationAttemptId {
    final $$IdentificationAttemptsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.identificationAttemptId,
          referencedTable: $db.identificationAttempts,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IdentificationAttemptsTableFilterComposer(
                $db: $db,
                $table: $db.identificationAttempts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$DiscoveriesTableOrderingComposer
    extends Composer<_$TaxaDatabase, $DiscoveriesTable> {
  $$DiscoveriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  $$TaxonomyEntriesTableOrderingComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CaptureAttemptsTableOrderingComposer get captureAttemptId {
    final $$CaptureAttemptsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.captureAttemptId,
      referencedTable: $db.captureAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaptureAttemptsTableOrderingComposer(
            $db: $db,
            $table: $db.captureAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IdentificationAttemptsTableOrderingComposer get identificationAttemptId {
    final $$IdentificationAttemptsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.identificationAttemptId,
          referencedTable: $db.identificationAttempts,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IdentificationAttemptsTableOrderingComposer(
                $db: $db,
                $table: $db.identificationAttempts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$DiscoveriesTableAnnotationComposer
    extends Composer<_$TaxaDatabase, $DiscoveriesTable> {
  $$DiscoveriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncRevision => $composableBuilder(
    column: $table.syncRevision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  $$TaxonomyEntriesTableAnnotationComposer get taxonomyEntryId {
    final $$TaxonomyEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taxonomyEntryId,
      referencedTable: $db.taxonomyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxonomyEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.taxonomyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CaptureAttemptsTableAnnotationComposer get captureAttemptId {
    final $$CaptureAttemptsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.captureAttemptId,
      referencedTable: $db.captureAttempts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaptureAttemptsTableAnnotationComposer(
            $db: $db,
            $table: $db.captureAttempts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IdentificationAttemptsTableAnnotationComposer get identificationAttemptId {
    final $$IdentificationAttemptsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.identificationAttemptId,
          referencedTable: $db.identificationAttempts,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$IdentificationAttemptsTableAnnotationComposer(
                $db: $db,
                $table: $db.identificationAttempts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$DiscoveriesTableTableManager
    extends
        RootTableManager<
          _$TaxaDatabase,
          $DiscoveriesTable,
          Discovery,
          $$DiscoveriesTableFilterComposer,
          $$DiscoveriesTableOrderingComposer,
          $$DiscoveriesTableAnnotationComposer,
          $$DiscoveriesTableCreateCompanionBuilder,
          $$DiscoveriesTableUpdateCompanionBuilder,
          (Discovery, $$DiscoveriesTableReferences),
          Discovery,
          PrefetchHooks Function({
            bool taxonomyEntryId,
            bool captureAttemptId,
            bool identificationAttemptId,
          })
        > {
  $$DiscoveriesTableTableManager(_$TaxaDatabase db, $DiscoveriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiscoveriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiscoveriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiscoveriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> taxonomyEntryId = const Value.absent(),
                Value<String?> captureAttemptId = const Value.absent(),
                Value<String?> identificationAttemptId = const Value.absent(),
                Value<DateTime> discoveredAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> syncRevision = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiscoveriesCompanion(
                id: id,
                taxonomyEntryId: taxonomyEntryId,
                captureAttemptId: captureAttemptId,
                identificationAttemptId: identificationAttemptId,
                discoveredAt: discoveredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String taxonomyEntryId,
                Value<String?> captureAttemptId = const Value.absent(),
                Value<String?> identificationAttemptId = const Value.absent(),
                required DateTime discoveredAt,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> syncRevision = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiscoveriesCompanion.insert(
                id: id,
                taxonomyEntryId: taxonomyEntryId,
                captureAttemptId: captureAttemptId,
                identificationAttemptId: identificationAttemptId,
                discoveredAt: discoveredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncRevision: syncRevision,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DiscoveriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                taxonomyEntryId = false,
                captureAttemptId = false,
                identificationAttemptId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (taxonomyEntryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.taxonomyEntryId,
                                    referencedTable:
                                        $$DiscoveriesTableReferences
                                            ._taxonomyEntryIdTable(db),
                                    referencedColumn:
                                        $$DiscoveriesTableReferences
                                            ._taxonomyEntryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (captureAttemptId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.captureAttemptId,
                                    referencedTable:
                                        $$DiscoveriesTableReferences
                                            ._captureAttemptIdTable(db),
                                    referencedColumn:
                                        $$DiscoveriesTableReferences
                                            ._captureAttemptIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (identificationAttemptId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn:
                                        table.identificationAttemptId,
                                    referencedTable:
                                        $$DiscoveriesTableReferences
                                            ._identificationAttemptIdTable(db),
                                    referencedColumn:
                                        $$DiscoveriesTableReferences
                                            ._identificationAttemptIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$DiscoveriesTableProcessedTableManager =
    ProcessedTableManager<
      _$TaxaDatabase,
      $DiscoveriesTable,
      Discovery,
      $$DiscoveriesTableFilterComposer,
      $$DiscoveriesTableOrderingComposer,
      $$DiscoveriesTableAnnotationComposer,
      $$DiscoveriesTableCreateCompanionBuilder,
      $$DiscoveriesTableUpdateCompanionBuilder,
      (Discovery, $$DiscoveriesTableReferences),
      Discovery,
      PrefetchHooks Function({
        bool taxonomyEntryId,
        bool captureAttemptId,
        bool identificationAttemptId,
      })
    >;

class $TaxaDatabaseManager {
  final _$TaxaDatabase _db;
  $TaxaDatabaseManager(this._db);
  $$TaxonomyEntriesTableTableManager get taxonomyEntries =>
      $$TaxonomyEntriesTableTableManager(_db, _db.taxonomyEntries);
  $$ChecklistGroupsTableTableManager get checklistGroups =>
      $$ChecklistGroupsTableTableManager(_db, _db.checklistGroups);
  $$ChecklistEntriesTableTableManager get checklistEntries =>
      $$ChecklistEntriesTableTableManager(_db, _db.checklistEntries);
  $$CaptureAttemptsTableTableManager get captureAttempts =>
      $$CaptureAttemptsTableTableManager(_db, _db.captureAttempts);
  $$IdentificationAttemptsTableTableManager get identificationAttempts =>
      $$IdentificationAttemptsTableTableManager(
        _db,
        _db.identificationAttempts,
      );
  $$DiscoveriesTableTableManager get discoveries =>
      $$DiscoveriesTableTableManager(_db, _db.discoveries);
}
