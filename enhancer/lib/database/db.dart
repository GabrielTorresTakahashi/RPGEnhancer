import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  // Private constructor
  DB._();

  // Database Instance
  static final DB instance = DB._();

  // SQLite instance
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'enhancer.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, version) async {
    await db.execute(_weapons);
    await db.execute(_characters);
    await db.execute(_skills);
    await db.insert('skills', {'name': 'Arcanismo'});
  }

  String get _weapons => '''
    CREATE TABLE weapons(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      damageDie TEXT,
      damageType TEXT,
      properties TEXT
    );
  ''';

  String get _characters => '''
    CREATE TABLE characters(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      strength TEXT,
      dexterity TEXT,
      intelligence TEXT
    );
  ''';

  String get _skills => '''
    CREATE TABLE skills(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    );
  ''';
}
