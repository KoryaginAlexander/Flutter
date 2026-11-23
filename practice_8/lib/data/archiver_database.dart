import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart' show Icons;

part 'archiver_database.g.dart';

/// Таблица архиваторов. Хранит название, описание, путь к изображению
/// и код иконки Material Icons (чтобы можно было восстановить IconData).
@DataClassName('ArchiverRow')
class Archivers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get image => text()();
  IntColumn get iconCode => integer()();
}

/// Drift-база данных приложения. Регистрируется в DI как lazySingleton:
/// создаётся при первом обращении и живёт на протяжении всего ЖЦ приложения.
@lazySingleton
@DriftDatabase(tables: [Archivers])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'archivers_drift'));

  @override
  int get schemaVersion => 1;

  /// Стратегия миграций: при первом создании БД таблицы создаются и
  /// заполняются начальным набором архиваторов.
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await batch((batch) {
        batch.insertAll(archivers, [
          ArchiversCompanion.insert(
            name: 'WinRAR',
            description: 'Форматы RAR и ZIP, шифрование',
            image: 'assets/images/winrar.png',
            iconCode: Icons.folder_zip.codePoint,
          ),
          ArchiversCompanion.insert(
            name: '7-Zip',
            description: 'Бесплатный, собственный формат 7z',
            image: 'assets/images/7zip.png',
            iconCode: Icons.compress.codePoint,
          ),
          ArchiversCompanion.insert(
            name: 'WinZip',
            description: 'Классика формата ZIP',
            image: 'assets/images/winzip.png',
            iconCode: Icons.archive.codePoint,
          ),
          ArchiversCompanion.insert(
            name: 'PeaZip',
            description: 'Открытый код, много форматов',
            image: 'assets/images/peazip.png',
            iconCode: Icons.unarchive.codePoint,
          ),
          ArchiversCompanion.insert(
            name: 'B1 Free Archiver',
            description: 'Кроссплатформенный, формат B1',
            image: 'assets/images/b1free.png',
            iconCode: Icons.inventory_2.codePoint,
          ),
        ]);
      });
    },
  );
}
