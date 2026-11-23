// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archiver_database.dart';

// ignore_for_file: type=lint
class $ArchiversTable extends Archivers
    with TableInfo<$ArchiversTable, ArchiverRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArchiversTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconCodeMeta = const VerificationMeta(
    'iconCode',
  );
  @override
  late final GeneratedColumn<int> iconCode = GeneratedColumn<int>(
    'icon_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    image,
    iconCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'archivers';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArchiverRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('icon_code')) {
      context.handle(
        _iconCodeMeta,
        iconCode.isAcceptableOrUnknown(data['icon_code']!, _iconCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_iconCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArchiverRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArchiverRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
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
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      iconCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_code'],
      )!,
    );
  }

  @override
  $ArchiversTable createAlias(String alias) {
    return $ArchiversTable(attachedDatabase, alias);
  }
}

class ArchiverRow extends DataClass implements Insertable<ArchiverRow> {
  final int id;
  final String name;
  final String description;
  final String image;
  final int iconCode;
  const ArchiverRow({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.iconCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['image'] = Variable<String>(image);
    map['icon_code'] = Variable<int>(iconCode);
    return map;
  }

  ArchiversCompanion toCompanion(bool nullToAbsent) {
    return ArchiversCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      image: Value(image),
      iconCode: Value(iconCode),
    );
  }

  factory ArchiverRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArchiverRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      iconCode: serializer.fromJson<int>(json['iconCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'iconCode': serializer.toJson<int>(iconCode),
    };
  }

  ArchiverRow copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    int? iconCode,
  }) => ArchiverRow(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    image: image ?? this.image,
    iconCode: iconCode ?? this.iconCode,
  );
  ArchiverRow copyWithCompanion(ArchiversCompanion data) {
    return ArchiverRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      image: data.image.present ? data.image.value : this.image,
      iconCode: data.iconCode.present ? data.iconCode.value : this.iconCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArchiverRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('iconCode: $iconCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, image, iconCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArchiverRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.image == this.image &&
          other.iconCode == this.iconCode);
}

class ArchiversCompanion extends UpdateCompanion<ArchiverRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> image;
  final Value<int> iconCode;
  const ArchiversCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.iconCode = const Value.absent(),
  });
  ArchiversCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String image,
    required int iconCode,
  }) : name = Value(name),
       description = Value(description),
       image = Value(image),
       iconCode = Value(iconCode);
  static Insertable<ArchiverRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? image,
    Expression<int>? iconCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (iconCode != null) 'icon_code': iconCode,
    });
  }

  ArchiversCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? image,
    Value<int>? iconCode,
  }) {
    return ArchiversCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      iconCode: iconCode ?? this.iconCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (iconCode.present) {
      map['icon_code'] = Variable<int>(iconCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArchiversCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('iconCode: $iconCode')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ArchiversTable archivers = $ArchiversTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [archivers];
}

typedef $$ArchiversTableCreateCompanionBuilder =
    ArchiversCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      required String image,
      required int iconCode,
    });
typedef $$ArchiversTableUpdateCompanionBuilder =
    ArchiversCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> image,
      Value<int> iconCode,
    });

class $$ArchiversTableFilterComposer
    extends Composer<_$AppDatabase, $ArchiversTable> {
  $$ArchiversTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
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

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get iconCode => $composableBuilder(
    column: $table.iconCode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ArchiversTableOrderingComposer
    extends Composer<_$AppDatabase, $ArchiversTable> {
  $$ArchiversTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
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

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconCode => $composableBuilder(
    column: $table.iconCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ArchiversTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArchiversTable> {
  $$ArchiversTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get iconCode =>
      $composableBuilder(column: $table.iconCode, builder: (column) => column);
}

class $$ArchiversTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArchiversTable,
          ArchiverRow,
          $$ArchiversTableFilterComposer,
          $$ArchiversTableOrderingComposer,
          $$ArchiversTableAnnotationComposer,
          $$ArchiversTableCreateCompanionBuilder,
          $$ArchiversTableUpdateCompanionBuilder,
          (
            ArchiverRow,
            BaseReferences<_$AppDatabase, $ArchiversTable, ArchiverRow>,
          ),
          ArchiverRow,
          PrefetchHooks Function()
        > {
  $$ArchiversTableTableManager(_$AppDatabase db, $ArchiversTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArchiversTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArchiversTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArchiversTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<int> iconCode = const Value.absent(),
              }) => ArchiversCompanion(
                id: id,
                name: name,
                description: description,
                image: image,
                iconCode: iconCode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                required String image,
                required int iconCode,
              }) => ArchiversCompanion.insert(
                id: id,
                name: name,
                description: description,
                image: image,
                iconCode: iconCode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ArchiversTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArchiversTable,
      ArchiverRow,
      $$ArchiversTableFilterComposer,
      $$ArchiversTableOrderingComposer,
      $$ArchiversTableAnnotationComposer,
      $$ArchiversTableCreateCompanionBuilder,
      $$ArchiversTableUpdateCompanionBuilder,
      (
        ArchiverRow,
        BaseReferences<_$AppDatabase, $ArchiversTable, ArchiverRow>,
      ),
      ArchiverRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ArchiversTableTableManager get archivers =>
      $$ArchiversTableTableManager(_db, _db.archivers);
}
