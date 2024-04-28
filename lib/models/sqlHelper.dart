import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  // Create tables
  static Future<void> createTables(sql.Database db) async {
    await db.execute("""
    CREATE TABLE notes(
      id INTEGER PRIMARY KEY NOT NULL,
      title TEXT,
      body TEXT,
    )
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
}
