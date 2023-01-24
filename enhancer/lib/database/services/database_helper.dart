import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/weapon_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "enhancer.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: ((db, version) async {
      await db.execute(''' CREATE TABLE IF NOT EXISTS Weapons(
                id INTEGER PRIMARY KEY,
                name TEXT NOT NULL,
                damage TEXT NOT NULL,
                price TEXT NOT NULL,
                weight TEXT NOT NULL,
                properties TEXT NOT NULL
                );
                ''');
    }), version: _version);
  }

  static Future<void> purgeDatabase() async {
    deleteDatabase(join(await getDatabasesPath(), _dbName));
  }

  static Future<int> addWeapon(Weapon weapon) async {
    final db = await _getDB();
    return await db.insert('Weapons', weapon.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateWeapon(Weapon weapon) async {
    final db = await _getDB();
    return await db.update("Weapons", weapon.toJson(),
        where: "id = ?",
        whereArgs: [weapon.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteWeapon(Weapon weapon) async {
    final db = await _getDB();
    return await db.delete("Weapons", where: "id = ?", whereArgs: [weapon.id]);
  }

  static Future<List<Weapon>?> getAllWeapons() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Weapons");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Weapon.fromJson(maps[index]));
  }

  static Future<int> addAllWeapons() async {
    final db = await _getDB();
    String sql = '''
      INSERT INTO Weapons
''';
    return await db.rawInsert(sql);
  }
}
