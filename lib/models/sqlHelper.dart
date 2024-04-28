import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class SQLHelper {
  // Create tables
  static Future<void> createTables(sql.Database db) async {
    await db.execute("""
    CREATE TABLE notes(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      body TEXT)
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'notes.db',
      version: 1,
      onCreate: (db, version) async {
        await createTables(db);
      },
    );
  }

  static Future<int> createNote(String title, String body) async {
    final db = await SQLHelper.db();
    final data = {'title': title, 'body': body};
    final id = await db.insert('notes', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await SQLHelper.db();
    final notes = await db.query('notes');
    return notes;
  }

  static Future<List<Map<String, dynamic>>> getNote(int id) async {
    final db = await SQLHelper.db();
    return db.query('notes', where: "id = ?", whereArgs: [int], limit: 1);
  }

  static Future<int> updateNote(int id, String title, String body) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'body': body,
    };
    final result = db.update('notes', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteNote(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('notes', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Failed to delete.");
    }
  }
}
