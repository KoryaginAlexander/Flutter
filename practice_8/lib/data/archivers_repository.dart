import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../models/archiver.dart';
import 'archiver_database.dart' as db;

/// Репозиторий — прослойка между BLoC и базой данных Drift. UI и BLoC не
/// знают, что данные хранятся в SQLite: они оперируют только моделью
/// Archiver и методами репозитория (get/add/update/delete).
@lazySingleton
class ArchiversRepository {
  final db.AppDatabase _db;
  ArchiversRepository(this._db);

  Archiver _fromRow(db.ArchiverRow row) => Archiver(
    row.id,
    row.name,
    row.description,
    row.image,
    IconData(row.iconCode, fontFamily: 'MaterialIcons'),
  );

  /// Получение информации обо всех архиваторах.
  Future<List<Archiver>> fetchArchivers() async {
    final rows = await _db.select(_db.archivers).get();
    return rows.map(_fromRow).toList();
  }

  /// Добавление нового архиватора.
  Future<void> addArchiver({
    required String name,
    required String description,
    required String image,
    required IconData icon,
  }) {
    return _db.into(_db.archivers).insert(
      db.ArchiversCompanion.insert(
        name: name,
        description: description,
        image: image,
        iconCode: icon.codePoint,
      ),
    );
  }

  /// Обновление описания архиватора по идентификатору.
  Future<void> updateDescription(int id, String description) {
    return (_db.update(_db.archivers)..where((t) => t.id.equals(id))).write(
      db.ArchiversCompanion(description: Value(description)),
    );
  }

  /// Удаление архиватора по идентификатору.
  Future<void> deleteArchiver(int id) {
    return (_db.delete(_db.archivers)..where((t) => t.id.equals(id))).go();
  }
}
