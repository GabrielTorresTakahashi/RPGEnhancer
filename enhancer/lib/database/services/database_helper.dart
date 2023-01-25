import 'package:enhancer/database/model/equipment_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/weapon_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "enhancer.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: ((db, version) async {
      await db.execute(''' 
        CREATE TABLE IF NOT EXISTS Weapons(
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          damage TEXT NOT NULL,
          price TEXT NOT NULL,
          weight TEXT NOT NULL,
          properties TEXT NOT NULL,
          range TEXT NOT NULL,
          type TEXT NOT NULL
        )''');

      await db.execute('''
        CREATE TABLE IF NOT EXISTS Equipments(
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          price TEXT NOT NULL,
          weight TEXT NOT NULL,
          category TEXT,
          description TEXT
        )''');

      addAllWeapons();
      addAllEquipments();
    }), version: _version);
  }

  // DO NOT USE THIS. unless in development phase.
  static Future<void> purgeDatabase() async {
    deleteDatabase(join(await getDatabasesPath(), _dbName));
  }

  // Weapons section
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

  // Equipments section
  static Future<List<Equipment>?> getAllEquipments() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Equipments", orderBy: 'name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
        maps.length, (index) => Equipment.fromJson(maps[index]));
  }

  static Future<int> addAllEquipments() async {
    final db = await _getDB();

    String sql = '''
      INSERT INTO Equipments (name, price, weight, group, description)
      VALUES
      ('Ábaco', '2 po', '1 kg', NULL, NULL),
      ('Ácido', '25 po', '0,5 kg', NULL, NULL),
      ('Água benta (frasco)', '25 po', '0,5 kg', NULL, NULL),
      ('Algemas', '2 po', '2 kg', NULL, NULL),
      ('Algibeira', '5 po', '0,5 kg', NULL, NULL),
      ('Aljava', '1 po', '0,5 kg', NULL, NULL),
      ('Ampulheta', '25 po', '0,5 kg', NULL, NULL),
      ('Antídoto (vidro)', '50 po', '-', NULL, NULL),
      ('Apito de advertência', '25 po', '0,5 kg', NULL, NULL),
      ('Aríete portátil', '4 po', '17,5 kg', NULL, NULL),
      ('Armadilha de caça', '5 po', '12,5 kg', NULL, NULL),
      ('Arpéu', '2 po', '2 kg', NULL, NULL),
      ('Balança de mercador', '5 po', '1,5 kg', NULL, NULL),
      ('Balde', '5 pc', '1 kg', NULL, NULL),
      ('Barril', '2 po', '35 kg', NULL, NULL),
      ('Baú', '5 po', '12,5 kg', NULL, NULL),
      ('Bolsa de componentes', '25 po', '1 kg', NULL, NULL),
      ('Caixa de fogo', '5 pp', '0,5 kg', NULL, NULL),
      ('Caneca', '2 pc', '0,5 kg', NULL, NULL),
      ('Caneta tinteiro', '2 pc', '-', NULL, NULL),
      ('Cantil', '2 pp', '2,5 kg', NULL, NULL),
      ('Cesto', '2 pp', '1 kg', NULL, NULL),
      ('Cobertor de inverno', '5 pp', '1,5 kg', NULL, NULL),
      ('Corda de cânhamo (15 metros)', '1 po', '5 kg', NULL, NULL),
      ('Corda de seda (15 metros)', '10 po', '2,5 kg', NULL, NULL),
      ('Corrente (3 metros)', '5 po', '5 kg', NULL, NULL),
      ('Equipamento de pescaria', '1 po', '2 kg', NULL, NULL),
      ('Escada (3 metros)', '1 pp', '12,5 kg', NULL, NULL),
      ('Esferas (sacola com 1.000)', '1 po', '1 kg', NULL, NULL),
      ('Espelho de aço', '5 po', '0,25 kg', NULL, NULL),
      ('Estrepes (bolsa com 20)', '1 po', '1 kg', NULL, NULL),
      ('Fechadura', '10 po', '0,5 kg', NULL, NULL),
      ('Bastão', '10 po', '1 kg', 'Foco arcano', NULL),
      ('Cajado', '5 po', '2,5 kg', 'Foco arcano', NULL),
      ('Cristal', '10 po', '0,5 kg', 'Foco arcano', NULL),
      ('Orbe', '20 po', '1,5 kg', 'Foco arcano', NULL),
      ('Varinha', '10 po', '0,5 kg', 'Foco arcano', NULL),
      ('Cajado de madeira', '5 po', '2 kg', 'Foco Druídico', NULL),
      ('Ramo de visco', '1 po', '-', 'Foco Druídico', NULL),
      ('Totem', '1 po', '-', 'Foco Druídico', NULL),
      ('Varinha de teixo', '10 po', '0,5 kg', 'Foco Druídico', NULL),
      ('Frasco', '2 pc', '1 kg', NULL, NULL),
      ('Garrafa de vidro', '1 po', '1 kg', NULL, NULL),
      ('Giz (1 peça)', '1 pc', '-', NULL, NULL),
      ('Grimório', '50 po', '1,5 kg', NULL, NULL),
      ('Jarra', '5 pc', '2 kg', NULL, NULL),
      ('Kit de escalada', '25 po', '6 kg', NULL, NULL),
      ('Kit de primeiros-socorros', '5 po', '1,5 kg', NULL, NULL),
      ('Lâmpada', '5 pp', '0,5 kg', NULL, NULL),
      ('Lanterna coberta', '5 po', '1 kg', NULL, NULL),
      ('Lanterna furta-fogo', '10 po', '1 kg', NULL, NULL),
      ('Lente de aumento', '100 po', '-', NULL, NULL),
      ('Livro', '25 po', '2,5 kg', NULL, NULL),
      ('Luneta', '1.000 po', '0,5 kg', NULL, NULL),
      ('Manto', '1 po', '2 kg', NULL, NULL),
      ('Marreta', '2 po', '5 kg', NULL, NULL),
      ('Martelo', '1 po', '1,5 kg', NULL, NULL),
      ('Mochila', '2 po', '2,5 kg', NULL, NULL),
      ('Balas de Funda (20)', '4 pc', '0,75 kg', 'Munição', NULL),
      ('Flechas (20)', '1 po', '0,5 kg', 'Munição', NULL),
      ('Virotes (20)', '1 po', '0,75 kg', 'Munição', NULL),
      ('Zarabatana (50)', '1 po', '0,5 kg', 'Munição', NULL),
      ('Óleo (frasco)', '1 pp', '0,5 kg', NULL, NULL),
      ('Pá', '2 po', '2,5 kg', NULL, NULL),
      ('Panela de ferro', '2 po', '5 kg', NULL, NULL),
      ('Papel (uma folha)', '2 pp', '-', NULL, NULL),
      ('Parafina', '5 pp', '-', NULL, NULL),
      ('Pé de cabra', '2 po', '2,5 kg', NULL, NULL),
      ('Pedra de amolar', '1 pc', '-', NULL, NULL),
      ('Perfume (frasco)', '5 po', '-', NULL, NULL),
      ('Pergaminho (uma folha)', '1 pp', '-', NULL, NULL),
      ('Picareta de minerador', '2 po', '5 kg', NULL, NULL),
      ('Píton', '5 pc', '-', NULL, NULL),
      ('Poção de cura', '50 po', '0,25 kg', NULL, NULL),
      ('Porta mapas ou pergaminhos', '1 po', '0,25 kg', NULL, NULL),
      ('Porta virotes', '1 po', '0,5 kg', NULL, NULL),
      ('Pregos de ferro (10)', '1 po', '2,5 kg', NULL, NULL),
      ('Rações de viagem (1 dia)', '5 pp', '1 kg', NULL, NULL),
      ('Robes', '1 po', '2 kg', NULL, NULL),
      ('Roldana e polia', '1 po', '2,5 kg', NULL, NULL),
      ('Roupas comuns', '5 pp', '1,5 kg', NULL, NULL),
      ('Roupas de viajante', '2 po', '2 kg', NULL, NULL),
      ('Roupas de entretenimento', '5 po', '2 kg', NULL, NULL),
      ('Roupas finas', '15 po', '3 kg', NULL, NULL),
      ('Sabão', '2 pc', '-', NULL, NULL),
      ('Saco', '1 pc', '0,25 kg', NULL, NULL),
      ('Saco de dormir', '1 po', '3,5 kg', NULL, NULL),
      ('Amuleto', '5 po', '0,5 kg', 'Símbolo sagrado', NULL),
      ('Emblema', '5 po', '-', 'Símbolo sagrado', NULL),
      ('Relicário', '5 po', '1 kg', 'Símbolo sagrado', NULL),
      ('Sinete', '5 po', '-', NULL, NULL),
      ('Sino', '1 po', '-', NULL, NULL),
      ('Tenda para duas pessoas', '2 po', '10 kg', NULL, NULL),
      ('Tocha', '1 pc', '0,5 kg', NULL, NULL),
      ('Tinta (frasco de 30 ml)', '10 po', '-', NULL, NULL),
      ('Vara (3 metros)', '5 pc', '3,5 kg', NULL, NULL),
      ('Vela', '1 pc', '3,5 kg', NULL, NULL),
      ('Veneno básico (frasco)', '100 po', '-', NULL, NULL),
    ''';

    return await db.rawInsert(sql);
  }
}
