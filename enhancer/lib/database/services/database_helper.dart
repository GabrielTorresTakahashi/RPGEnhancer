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
                properties TEXT NOT NULL,
                range TEXT NOT NULL,
                type TEXT NOT NULL
                );
                ''');
      addAllWeapons();
    }), version: _version);
  }

  static Future<void> purgeDatabase() async {
    deleteDatabase(join(await getDatabasesPath(), _dbName));
  }

  static Future<List<Weapon>?> getAllWeapons() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Weapons", orderBy: 'type DESC, range ASC, name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Weapon.fromJson(maps[index]));
  }

  static Future<int> addAllWeapons() async {
    final db = await _getDB();
    String sql = '''
  INSERT INTO
    weapons (name, price, damage, weight, properties, range, type)
  VALUES
    ('Adaga', '2 po', '1d4 perfurante', '0,5 kg', 'Acuidade, leve, arremesso (distância 6/18)', 'Corpo-a-corpo', 'Simples'),
    ('Azagaia', '5 pp', '1d6 perfurante', '1 kg', 'Arremesso (distância 9/36)', 'Corpo-a-corpo', 'Simples'),
    ('Bordão', '2 pp', '1d6 concussão', '2 kg', 'Versátil (1d8)', 'Corpo-a-corpo', 'Simples'),
    ('Clava Grande', '2 pp', '1d8 concussão', '5 kg', 'Pesada, duas mãos', 'Corpo-a-corpo', 'Simples'),
    ('Foice Curta', '1 po', '1d4 cortante', '1 kg', 'Leve', 'Corpo-a-corpo', 'Simples'),
    ('Lança', '1 po', '1d6 perfurante', '1,5 kg', 'Arremesso (distância 6/18), versátil (1d8)', 'Corpo-a-corpo', 'Simples'),
    ('Maça', '5 po', '1d6 concussão', '2 kg', '-', 'Corpo-a-corpo', 'Simples'),
    ('Machadinha', '5 po', '1d6 cortante', '1 kg', 'Leve, arremesso (distância 6/18)', 'Corpo-a-corpo', 'Simples'),
    ('Martelo Leve', '2 po', '1d4 concussão', '1 kg', 'Leve, arremesso (distância 6/18)', 'Corpo-a-corpo', 'Simples'),
    ('Porrete', '1 pp', '1d4 concussão', '1 kg', 'Leve', 'Corpo-a-corpo', 'Simples'),
    ('Arco Curto', '25 po', '1d6 perfurante', '1 kg', 'Munição (distância 24/96), duas mãos', 'À Distância', 'Simples'),
    ('Besta Leve', '25 po', '1d8 perfurante', '2,5 kg', 'Munição (distância 24/96), recarga, duas mãos', 'À Distância', 'Simples'),
    ('Dardo', '5 pc', '1d4 perfurante', '0,1 kg', 'Acuidade, arremesso (distância 6/18)', 'À Distância', 'Simples'),
    ('Funda', '1 pp', '1d4 concussão', '-', 'Munição (distância 9/36)', 'À Distância', 'Simples'),
    ('Alabarda', '20 po', '1d10 cortante', '3 kg', 'Pesada, alcance, duas mãos', 'Corpo-a-corpo', 'Marcial'),
    ('Cimitarra', '25 po', '1d6 cortante', '1,5 kg', 'Acuidade, leve', 'Corpo-a-corpo', 'Marcial'),
    ('Chicote', '2 po', '1d4 cortante', '1,5 kg', 'Acuidade, alcance', 'Corpo-a-corpo', 'Marcial'),
    ('Espada Curta', '10 po', '1d6 cortante', '1 kg', 'Acuidade, leve', 'Corpo-a-corpo', 'Marcial'),
    ('Glaive', '20 po', '1d10 cortante', '3 kg', 'Pesada, alcance, duas mãos', 'Corpo-a-corpo', 'Marcial'),
    ('Lança de Montaria', '10 po', '1d12 perfurante', '3 kg', 'Alcance, especial', 'Corpo-a-corpo', 'Marcial'),
    ('Lança Longa', '5 po', '1d10 perfurante', '4 kg', 'Pesada, alcance, duas mãos', 'Corpo-a-corpo', 'Marcial'),
    ('Maça Estrela', '15 po', '1d8 perfurante', '2 kg', '-', 'Corpo-a-corpo', 'Marcial'),
    ('Machado Grande', '30 po', '1d12 cortante', '3,5 kg', 'Pesada, duas mãos', 'Corpo-a-corpo', 'Marcial'),
    ('Machado de Batalha', '10 po', '1d8 cortante', '2 kg', 'Versátil (1d10)', 'Corpo-a-corpo', 'Marcial'),
    ('Malho', '10 po', '2d6 concussão', '5 kg', 'Pesada, duas mãos', 'Corpo-a-corpo', 'Marcial'),
    ('Mangual', '10 po', '1d8 concussão', '5 kg', 'Pesada, duas mãos', 'Corpo-a-corpo', 'Marcial'),
    ('Martelo de Guerra', '10 po', '1d8 concussão', '5 kg', 'Versátil (1d10)', 'Corpo-a-corpo', 'Marcial'),
    ('Rapieira', '25 po', '1d8 perfurante', '1 kg', 'Acuidade', 'Corpo-a-corpo', 'Marcial'),
    ('Tridente', '5 po', '1d6 perfurante', '2 kg', 'Arremesso (6/18), versátil (1d8)', 'Corpo-a-corpo', 'Marcial'),
    ('Arco Longo', '50 po', '1d8 perfurante', '1 kg', 'Munição (distância 45/180), pesada, duas mãos', 'À Distância', 'Marcial'),
    ('Besta de Mão', '75 po', '1d6 perfurante', '1,5 kg', 'Munição (distância 9/36), leve, recarga', 'À Distância', 'Marcial'),
    ('Besta Pesada', '50 po', '1d10 perfurante', '4,5 kg', 'Munição (distância 30/120), pesada, recarga, duas mãos', 'À Distância', 'Marcial'),
    ('Rede', '1 po', '-', '1,5 kg', 'Especial, arremesso (distância 1,5/4,5)', 'À Distância', 'Marcial'),
    ('Zarabatana', '10 po', '1 perfurante', '0,5 kg', 'Munição (distância 7,5/30), recarga', 'À Distância', 'Marcial');
''';
    return await db.rawInsert(sql);
  }
}
