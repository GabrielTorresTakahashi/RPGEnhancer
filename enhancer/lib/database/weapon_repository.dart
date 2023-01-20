import 'package:enhancer/database/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class WeaponRepository extends ChangeNotifier {
  late Database db;
  String? _name;
  String? _damageDie;
  String? _damageType;

  get name => _name;
  get damageDie => _damageDie;
  get damageType => _damageType;

  WeaponRepository() {
    _initRepository();
  }
  // damageType TEXT,
  // properties TEXT
  _initRepository() async {
    await _getName();
    await _getDamageDie();
    await _getDamageType();
  }

  _getName() async {
    db = await DB.instance.database;
    List name = await db.query('weapon', columns: ['name']);
    _name = name.first;
  }

  setName(String name) async {
    db = await DB.instance.database;
    db.update('weapon', {'name': name});
  }

  _getDamageDie() async {
    db = await DB.instance.database;
    List damageDie = await db.query('weapon', columns: ['damageDie']);
    _damageDie = damageDie.first;
  }

  setDamageDie(String damageDie) async {
    db = await DB.instance.database;
    db.update('weapon', {'damageDie': damageDie});
  }

  _getDamageType() async {
    db = await DB.instance.database;
    List damageType = await db.query('weapon', columns: ['damageType']);
    _damageType = damageType.first;
  }

  setDamageType(String damageType) async {
    db = await DB.instance.database;
    db.update('weapon', {'damageDie': damageType});
  }
}
