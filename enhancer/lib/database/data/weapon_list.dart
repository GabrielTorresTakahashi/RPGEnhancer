import 'package:enhancer/database/model/weapon.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> createWeaponList() async {
  // Database for the app
  final database = openDatabase(
    join(await getDatabasesPath(), 'enhancer.db'),
    version: 1,
    onCreate: ((db, version) {
      return db.execute(
        "CREATE TABLE weapons("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT,"
        "price TEXT"
        "dice TEXT,"
        "damageType TEXT"
        "weaponType TEXT,"
        "range TEXT"
        "attributes TEXT)",
      );
    }),
  );

  // ignore: unused_element
  Future<void> insertWeapon(Weapon weapon) async {
    final db = await database;
    await db.insert('weapons', weapon.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // ignore: unused_element
  Future<List<Weapon>> weapons() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('weapons');

    return List.generate(maps.length, (index) {
      return Weapon(
          id: maps[index]['id'],
          name: maps[index]['name'],
          price: maps[index]['price'],
          dice: maps[index]['dice'],
          damageType: maps[index]['damageType'],
          weaponType: maps[index]['type'],
          range: maps[index]['range'],
          properties: maps[index]['attributes']);
    });
  }

  // ignore: unused_element
  Future<void> updateWeapon(Weapon weapon) async {
    final db = await database;

    await db.update(
      'weapons',
      weapon.toMap(),
      where: 'id = ?',
      whereArgs: [weapon.id],
    );
  }

  // ignore: unused_element
  Future<void> deleteWeapon(int id) async {
    final db = await database;

    await db.delete(
      'weapons',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  var mace = const Weapon(
      id: 1,
      name: '2',
      price: '5 po',
      dice: 'D6',
      damageType: 'Concussão',
      weaponType: 'Simple',
      range: 'Melee',
      properties: null);

  var weaponList = [mace];

  for (var element in weaponList) {
    await insertWeapon(element);
  }

}
