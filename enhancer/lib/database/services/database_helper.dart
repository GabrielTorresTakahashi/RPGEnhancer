import 'package:enhancer/database/model/alignment_model.dart';
import 'package:enhancer/database/model/armor_model.dart';
import 'package:enhancer/database/model/background_model.dart';
import 'package:enhancer/database/model/character_model.dart';
import 'package:enhancer/database/model/equipment_model.dart';
import 'package:enhancer/database/model/race_model.dart';
import 'package:enhancer/database/model/skill_model.dart';
import 'package:enhancer/database/model/subrace_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/weapon_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "enhancer.db";
  static const String _armorTable = '''
        CREATE TABLE IF NOT EXISTS Armor(
          id INTEGER PRIMARY KEY,
          category TEXT NOT NULL,
          name TEXT NOT NULL,
          price TEXT NOT NULL,
          armorClass TEXT NOT NULL,
          weight TEXT NOT NULL,
          strength TEXT,
          stealth TEXT
        )''';
  static const String _equipmentsTable = '''
        CREATE TABLE IF NOT EXISTS Equipments(
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          price TEXT NOT NULL,
          weight TEXT NOT NULL,
          category TEXT,
          description TEXT
        )''';
  static const String _weaponsTable = ''' 
        CREATE TABLE IF NOT EXISTS Weapons(
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          damage TEXT NOT NULL,
          price TEXT NOT NULL,
          weight TEXT NOT NULL,
          properties TEXT NOT NULL,
          range TEXT NOT NULL,
          type TEXT NOT NULL
        )''';

  static const String _skillsTable = '''CREATE TABLE IF NOT EXISTS `Skills` (
        `id` INT NOT NULL,
        `name` TEXT NOT NULL,
        `ability` TEXT NOT NULL,
        PRIMARY KEY (`id`)
      )''';

  static const String _backgroundsTable =
      '''CREATE TABLE IF NOT EXISTS `Backgrounds` (
      `id` INT NOT NULL,
      `name` TEXT NOT NULL,
      `trait` TEXT NOT NULL,
      `description` TEXT NOT NULL,
      `skills` TEXT NULL,
      `tools` TEXT NULL,
      `languages` TEXT NULL,
      `equipment` TEXT NULL,
      PRIMARY KEY (`id`)
    )''';

  static const String _racesTable = '''CREATE TABLE IF NOT EXISTS `Races` (
        `id` INT NOT NULL,
        `name` TEXT NOT NULL,
        `abilityScore` TEXT NOT NULL,
        `speed` TEXT NULL,
        `languages` TEXT NOT NULL,
        `traits` TEXT NULL,
        PRIMARY KEY (`id`)
      )''';

  static const String _subracesTable =
      '''CREATE TABLE IF NOT EXISTS `Subraces` (
        `id` INT NOT NULL,
        `name` TEXT NULL,
        `abilityScore` TEXT NULL,
        `traits` TEXT NULL,
        `raceId` INT NOT NULL,
        `speed` TEXT NULL,
        PRIMARY KEY (`id`, `raceId`),
        FOREIGN KEY (`raceId`) REFERENCES `Races` (`id`)
      )''';

  static const String _alignmentsTable =
      '''CREATE TABLE IF NOT EXISTS `Alignments` (
        `id` INT NOT NULL,
        `name` TEXT NOT NULL,
        `alias` TEXT NOT NULL,
        PRIMARY KEY (`id`)
      )''';

  static const String _characterTable =
      '''CREATE TABLE IF NOT EXISTS `Characters` (
        `id` INT NOT NULL,
        `name` TEXT NOT NULL,
        `level` INT NOT NULL,
        `background` TEXT NOT NULL,
        `xp` INT NULL,
        `strength` INT NULL,
        `dexterity` INT NULL,
        `constitution` INT NULL,
        `intelligence` INT NULL,
        `wisdom` INT NULL,
        `charisma` INT NULL,
        `otherProficiencies` TEXT NULL,
        `languages` TEXT NULL,
        `speed` TEXT NULL,
        `hp` INT NULL,
        `tempHp` INT NULL,
        `equipment` TEXT NULL,
        `pl` INT NULL,
        `gp` INT NULL,
        `personality` TEXT NULL,
        `ideals` TEXT NULL,
        `bonds` TEXT NULL,
        `flaws` TEXT NULL,
        `traits` TEXT NULL,
        `age` INT NULL,
        `height` TEXT NULL,
        `weight` TEXT NULL,
        `eyes` TEXT NULL,
        `skin` TEXT NULL,
        `hair` TEXT NULL,
        `alliesOrganizations` TEXT NULL,
        `characterHistory` TEXT NULL,
        `additionalTraits` TEXT NULL,
        `treasure` TEXT NULL,
        `alignmentId` INT NOT NULL,
        `raceId` INT NOT NULL,
        `backgroundsId` INT NOT NULL,
        `armorId` INT NOT NULL,
        PRIMARY KEY (
          `id`,
          `raceId`,
          `alignmentId`,
          `backgroundsId`,
          `armorId`
        ),
        FOREIGN KEY (`alignmentId`) REFERENCES `Alignments` (`id`),
        FOREIGN KEY (`raceId`) REFERENCES `Races` (`id`),
        FOREIGN KEY (`backgroundsId`) REFERENCES `Backgrounds` (`id`),
        FOREIGN KEY (`armorId`) REFERENCES `Armor` (`id`)
      )''';

  static const String _skillBackgroundTable =
      '''CREATE TABLE IF NOT EXISTS `SkillBackground` (
        `id` INT NOT NULL,
        `skillId` INT NOT NULL,
        `backgroundId` INT NOT NULL,
        PRIMARY KEY (`id`, `skillId`, `backgroundId`),
        FOREIGN KEY (`skillId`) REFERENCES `Skills` (`id`),
        FOREIGN KEY (`backgroundId`) REFERENCES `Backgrounds` (`id`)
      )''';

  static const String _weaponCharacterTable =
      '''CREATE TABLE IF NOT EXISTS `weaponCharacter` (
        `id` INT NOT NULL,
        `characterId` INT NOT NULL,
        `weaponId` INT NOT NULL,
        PRIMARY KEY (`id`, `characterId`, `weaponId`),
        FOREIGN KEY (`characterId`) REFERENCES `Character` (`id`),
        FOREIGN KEY (`weaponId`) REFERENCES `Weapons` (`id`)
      )''';

  static const String _skillCharacterTable =
      '''CREATE TABLE IF NOT EXISTS `SkillCharacter` (
        `id` INT NOT NULL,
        `skillId` INT NOT NULL,
        `characterId` INT NOT NULL,
        PRIMARY KEY (`id`, `skillId`, `characterId`),
        FOREIGN KEY (`skillId`) REFERENCES `Skills` (`id`),
        FOREIGN KEY (`characterId`) REFERENCES `Character` (`id`)
      )''';

  static const String _equipmentCharacterTable =
      '''CREATE TABLE IF NOT EXISTS EquipmentCharacter (
        `id` INT NOT NULL,
        `characterId` INT NOT NULL,
        `equipmentId` INT NOT NULL,
        PRIMARY KEY (`id`, `characterId`, `equipmentId`),
        FOREIGN KEY (`characterId`) REFERENCES `Character` (`id`),
        FOREIGN KEY (`equipmentId`) REFERENCES `Equipments` (`id`)
      )''';

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: ((db, version) async {
      await db.execute(_weaponsTable);

      await db.execute(_equipmentsTable);

      await db.execute(_armorTable);

      await db.execute(_skillsTable);

      await db.execute(_backgroundsTable);

      await db.execute(_racesTable);

      await db.execute(_subracesTable);

      await db.execute(_alignmentsTable);

      await db.execute(_characterTable);

      await db.execute(_skillBackgroundTable);

      await db.execute(_weaponCharacterTable);

      await db.execute(_skillCharacterTable);

      await db.execute(_equipmentCharacterTable);

      insertDefaultData();
    }), version: _version);
  }

  static void insertDefaultData() async {
    addAllWeapons();
    addAllEquipments();
    addAllArmor();
  }

  // DO NOT USE THIS. unless in development phase.
  static void purgeDatabase() async {
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

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM Equipments ORDER BY name COLLATE LOCALIZED ASC");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
        maps.length, (index) => Equipment.fromJson(maps[index]));
  }

  static Future<int> addAllEquipments() async {
    final db = await _getDB();

    String sql = '''
      INSERT INTO Equipments (name, price, weight, category, description)
      VALUES
      ('Ábaco', '2 po', '1 kg', NULL, 'O ábaco é um instrumento de cálculo, formado por uma moldura com bastões ou arames paralelos, dispostos no sentido vertical, correspondentes cada um a uma posição digital (unidades, dezenas, etc.) e nos quais estão os elementos de contagem (fichas, bolas ou contas) que podem fazer-se deslizar livremente.'),
      ('Ácido', '25 po', '0,5 kg', NULL, 'Usando uma ação, você pode despejar o conteúdo desse vidro em uma criatura a até 1,5 metro de você, ou arremessar o vidro a até 6 metros de distância, quebrando-o no impacto. Em ambos os casos, você deve realizar um ataque à distância contra uma criatura ou objeto, tratando o ácido como uma arma improvisada. Se acertar, o alvo sofre 2d6 de dano ácido.'),
      ('Água benta (frasco)', '25 po', '0,5 kg', NULL, 'Usando uma ação, você pode espalhar o conteúdo dessse frasco em uma criatura a até 1,5 metro de você ou arremessar a até 6 metros, quebrando o frasco com o impacto. Em ambos os casos, você deve realizar um ataque à distância contra uma criatura alvo, tratando-a como uma arma improvisada. Se o alvo for um corruptor ou morto-vivo, ele sofre 2d6 de dano radiante. Um clérigo ou paladino pode criar água benta realizando um ritual especial. O ritual leva 1 hora para ser realizado, consome 25 po de prata em pó e exige que se gaste um espaço de magia de 1º nível.'),
      ('Algemas', '2 po', '2 kg', NULL, 'Essas algemas de metal podem prender uma criatura Pequena ou Média. Escapar das algemas exige um sucesso em um teste de Destreza CD 20 bem sucedido. Cada conjunto de algemas vem com uma chave. Sem a chave, uma criatura proficiente com ferramentas de ladrão pode abrir a fechadura das algemas com um sucesso em um teste de Destreza CD 15. As algemas têm 15 pontos de vida.'),
      ('Algibeira', '5 po', '0,5 kg', NULL, 'Uma bolsa de pano ou couro que pode armazenar até 20 munições de funda ou 50 munições de zarabatana, entre outras coisas. Para armazenar componentes de magia, veja bolsa de componentes, também descrita nessa seção.'),
      ('Aljava', '1 po', '0,5 kg', NULL, 'Uma aljava pode guardar até 20 flechas'),
      ('Ampulheta', '25 po', '0,5 kg', NULL, NULL),
      ('Antídoto (vidro)', '50 po', '-', NULL, 'Uma criatura que beber o líquido desse vidro tem vantagem em testes de resistência contra venenos por 1 hora. O antídoto não confere nenhum benefício para mortos-vivos ou constructos.'),
      ('Apito de advertência', '25 po', '0,5 kg', NULL, NULL),
      ('Aríete portátil', '4 po', '17,5 kg', NULL, 'Você pode usar um aríete portátil para quebrar portas. Ao fazer isso, você ganha um bônus de +4 no teste de Força. Outra criatura pode ajudá-lo a usar o aríete, o que concede vantagem no teste.'),
      ('Armadilha de caça', '5 po', '12,5 kg', NULL, 'Quando você usa sua ação para armá-la, essa armadilha forma um anel de aço com dentes serrilhados. Eles se fecham quando uma criatura pisa sobre uma placa de pressão no seu centro. A armadilha é fixada por uma pesada corrente em um objeto fixo e imóvel, como uma árvore ou um cravo enterrado no chão. Uma criatura que pisasr na placa de pressão deve ser bem sucedida em um teste de resistência de Destreza CD 13 ou sofrerá 1d4 de dano perfurante e para de se mover. Daí em diante, até que a criatura se liberte da armadilha, seu movimento é limitado ao comprimento da corrente (tipicamente 1 metro de comprimento). A criatura presa pode usar sua ação para fazer um teste de Força CD 13 e se libertar, ou outra criatura no alcance pode fazer o teste para libertá-la. Cada fracasso no teste caus 1 de dano perfurante à criatura presa.'),
      ('Arpéu', '2 po', '2 kg', NULL, NULL),
      ('Balança de mercador', '5 po', '1,5 kg', NULL, 'Trata-se de uma pequena balança, pratos e um sortimento adequado de pesos de até 1 kg. Com ela, você pode medir o peso exato de pequenos objetos, como metais preciosos brutos ou bens comerciais, para ajudar a determinar seu valor.'),
      ('Balde', '5 pc', '1 kg', NULL, 'Capacidade: 12 litros/15 cm cúbicos de um sólido'),
      ('Barril', '2 po', '35 kg', NULL, 'Capacidade: 160 litros/1,2 m cúbicos de um sólido'),
      ('Baú', '5 po', '12,5 kg', NULL, 'Capacidade: 3,5 m cúbicos de um sólido/150 kg de equipamentos'),
      ('Bolsa de componentes', '25 po', '1 kg', NULL, 'Trata-se de uma pequena bolsa de couro à prova de água que pode ser fixada em um cinto. Ela possui compartimentos para armazenar todos os componentes materiais e outros itens especiais que você precisa para lançar suas magias, exceto os componentes que possuem um custo específico (conforme indicado na descrição da magia).'),
      ('Caixa de fogo', '5 pp', '0,5 kg', NULL, 'Esse pequeno recipiente detém uma pederneira, isqueiro e um pavio (um pano geralmente seco embebido em óleo) usdo para acender uma fogueira. Usá-lo para acender uma tocha - ou qualquer outra coisa exposta a um combustível abundante - leva uma ação. Acender qualquer outro fogo leva 1 minuto.'),
      ('Caneca', '2 pc', '0,5 kg', NULL, 'Capacidade: 50 ml'),
      ('Caneta tinteiro', '2 pc', '-', NULL, NULL),
      ('Cantil', '2 pp', '2,5 kg', NULL, 'Capacidade: 2 litros'),
      ('Cesto', '2 pp', '1 kg', NULL, 'Capacidade: 60 cm cúbicos de um sólido/20 kg de equipamentos'),
      ('Cobertor de inverno', '5 pp', '1,5 kg', NULL, NULL),
      ('Corda de cânhamo (15 metros)', '1 po', '5 kg', NULL, 'A corda tem 2 pontos de vida e pode ser arrebentada com um teste de Força CD 17 bem sucedido.'),
      ('Corda de seda (15 metros)', '10 po', '2,5 kg', NULL, 'A corda tem 2 pontos de vida e pode ser arrebentada com um teste de Força CD 17 bem sucedido.'),
      ('Corrente (3 metros)', '5 po', '5 kg', NULL, 'Uma corrente possui 10 pontos de vida e pode ser arrebentada com um teste de Força CD 20 bem sucedido.'),
      ('Equipamento de pescaria', '1 po', '2 kg', NULL, 'Este kit inclui uma vara de pesca de madeira, linha de seda, boias de cortiça, anzóis de aço, chumbadas, iscas e redes de pesca.'),
      ('Escada (3 metros)', '1 pp', '12,5 kg', NULL, NULL),
      ('Esferas (sacola com 1.000)', '1 po', '1 kg', NULL, 'Usando uma ação, você pode despejar essas minúsculas esferas de metal para cobrir a área de um quadrado de 3 metros de lado. A criatura que se mover dentro da área deve ser bem sucedida em um teste de resistência de Destreza CD 10 para não cair no chão. Uma criatura que mover pela área usando metade do seu deslocamento não precisa fazer o teste de resistência.'),
      ('Espelho de aço', '5 po', '0,25 kg', NULL, NULL),
      ('Estrepes (bolsa com 20)', '1 po', '1 kg', NULL, 'Usando uma ação, você pode espalhar um único saco de estrepes para cobrir a área de um quadrado de 1,5 metro de lado. qualquer criatura que entrar na área deve ser ben sucedida em um teste de resistência de Destreza CD 15. Se falhar, para de se mover e sofre 1 de dano perfurante. Até que a criatura recupere pelo menos 1 ponto de vida, seu deslocamento de caminhada é reduzido em 3 metros. Uma criatura que se mover pela área usando metade do seu deslocamento não precisa fazer o teste de resistência.'),
      ('Fechadura', '10 po', '0,5 kg', NULL, 'A fechadura vem com uma chave. Sem a chave, uma criatura proficiente com ferramentas de ladrão pode abrir a fechadura com um sucesso em um teste de Destreza CD 15. O Mestre pode decidir que fechaduras melhores estão disponíveis por preços mais elevados.'),
      ('Bastão', '10 po', '1 kg', 'Foco arcano', 'Um foco arcano é um item especial - um orbe, um cristal, um bastão, um cajado especialmente construído, uma varinha de madeira ou algum item semelhante - projetado para canalizar o poder de magias arcanas. Um feiticeiro, bruxo ou mago podem usá-lo como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Cajado', '5 po', '2,5 kg', 'Foco arcano', 'Um foco arcano é um item especial - um orbe, um cristal, um bastão, um cajado especialmente construído, uma varinha de madeira ou algum item semelhante - projetado para canalizar o poder de magias arcanas. Um feiticeiro, bruxo ou mago podem usá-lo como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Cristal', '10 po', '0,5 kg', 'Foco arcano', 'Um foco arcano é um item especial - um orbe, um cristal, um bastão, um cajado especialmente construído, uma varinha de madeira ou algum item semelhante - projetado para canalizar o poder de magias arcanas. Um feiticeiro, bruxo ou mago podem usá-lo como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Orbe', '20 po', '1,5 kg', 'Foco arcano', 'Um foco arcano é um item especial - um orbe, um cristal, um bastão, um cajado especialmente construído, uma varinha de madeira ou algum item semelhante - projetado para canalizar o poder de magias arcanas. Um feiticeiro, bruxo ou mago podem usá-lo como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Varinha', '10 po', '0,5 kg', 'Foco arcano', 'Um foco arcano é um item especial - um orbe, um cristal, um bastão, um cajado especialmente construído, uma varinha de madeira ou algum item semelhante - projetado para canalizar o poder de magias arcanas. Um feiticeiro, bruxo ou mago podem usá-lo como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Cajado de madeira', '5 po', '2 kg', 'Foco Druídico', 'Um foco druídico pode ser um ramo de visco ou azevinho, uma varinha ou cetro de teixo ou de outra madeira especial, um cajado esculpido de uma árvore viva, ou um totem adornado com penas, peles, ossos e dentes de animais sagrados. Um druida pode usar tal objeto como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Ramo de visco', '1 po', '-', 'Foco Druídico', 'Um foco druídico pode ser um ramo de visco ou azevinho, uma varinha ou cetro de teixo ou de outra madeira especial, um cajado esculpido de uma árvore viva, ou um totem adornado com penas, peles, ossos e dentes de animais sagrados. Um druida pode usar tal objeto como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Totem', '1 po', '-', 'Foco Druídico', 'Um foco druídico pode ser um ramo de visco ou azevinho, uma varinha ou cetro de teixo ou de outra madeira especial, um cajado esculpido de uma árvore viva, ou um totem adornado com penas, peles, ossos e dentes de animais sagrados. Um druida pode usar tal objeto como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Varinha de teixo', '10 po', '0,5 kg', 'Foco Druídico', 'Um foco druídico pode ser um ramo de visco ou azevinho, uma varinha ou cetro de teixo ou de outra madeira especial, um cajado esculpido de uma árvore viva, ou um totem adornado com penas, peles, ossos e dentes de animais sagrados. Um druida pode usar tal objeto como um foco de conjuração, conforme descrito no capítulo 10.'),
      ('Fogo alquímico (frasco)', '50 po', '0,5 kg', NULL, 'Esse líquido pégajoso e adesivo inflama em contato com o ar. Usando uma ação, você pode arremessar esse frasco a até 6 metros de distância, quebrando-o com o impacto. Você deve realizar um ataque à distância contra uma criatura ou objeto, tratando o fogo alquímico como uma arma improvisada. Em um sucesso, o alvo sofre 1d4 de dano de fogo no início de cada um de seus turnos. Uma criatura pode terminar esse dano usando sua ação e fazendo um teste de resistência de Destreza CD 10 para apagar as chamas.'),
      ('Frasco', '2 pc', '1 kg', NULL, 'Capacidade: 120 ml'),
      ('Garrafa de vidro', '1 po', '1 kg', NULL, 'Capacidade: 750 ml'),
      ('Giz (1 peça)', '1 pc', '-', NULL, NULL),
      ('Grimório', '50 po', '1,5 kg', NULL, 'Essencial para os magos, um grimório é um volume encadernado em couro com 100 páginas de pergaminhos em branco, adequado para armazenar magias.'),
      ('Jarra', '5 pc', '2 kg', NULL, 'Capacidade: 5 litros'),
      ('Kit de escalada', '25 po', '6 kg', NULL, 'Um kit de escalada inclui pítons especiais, botas com solas pontiagudas, luvas e um cinto. Você pode usar o kit de escalada como uma ação para ancorar-se. Quando faz isso, você não pode cair mais de 7,5 metros a partir do ponto onde se ancorou, e não pode subir mais de 7,5 metros de distância desse ponto, sem desfazer a âncora.'),
      ('Kit de primeiros-socorros', '5 po', '1,5 kg', NULL, 'Esse kit é uma bols de couro contendo ataduras, pomadas e talas. O kit possui material suficiente para dez usos. Usando uma ação, você pode gastar um uso do kit para estabilizar uma criatura que tenha 0 pontos de vida, sem a necessidade de realizar um teste de Sabedoria (Medicina).'),
      ('Kit de Refeição', '5 pp', '0,5 kg', NULL, 'Essa caixa de metal contém um copo e talheres simples. A caixa se desmonta no meio, um lado pode ser utilizado como uma panela para cozinhar e o outro como um prato ou uma tigela rasa.'),
      ('Lâmpada', '5 pp', '0,5 kg', NULL, 'Uma lâmpada lança luz plena em um raio de 4,5 metros e penumbra por mais 9 metros. Uma vez acesa, a lâmpada queima por 6 horas usando um frasco de óleo (500 ml).'),
      ('Lanterna coberta', '5 po', '1 kg', NULL, 'Uma lanterna coberta lança luz plena em um raio de 9 metros e penumbra por mais 9 metros. Uma vez acesa, ela queima por 6 horas usando um frasco de óleo (500 ml). Usando uma ação, você pode abaixar a cobertura, reduzindo a claridade para 1,5 metro.'),
      ('Lanterna furta-fogo', '10 po', '1 kg', NULL, 'Uma lanterna furta-fogo lança luz plena em um cone de 18 metros e penumbra por amis 18 metros. Uma vez acesa ela queima por 6 horas usando um frasco de óleo (500 ml).'),
      ('Lente de aumento', '100 po', '-', NULL, 'Essa lente permite ver pequenos objetos mais de perto. Ela também é útil para acender fogo. Usar uma lupa para acender fogo necessita de luz tão brilhante quanto a luz do sol para focar, um pavio e cerca de 5 minutos. Uma lente de aumento concede vantagem em qualquer teste de habilidade feito para avaliar ou inspecionar um item que é pequeno ou muito detalhado.'),
      ('Livro', '25 po', '2,5 kg', NULL, 'Um livro pode conter poesia, relatos históricos, informações relativas a um campo particular de sabedoria, diagramas e notas sobre engenhocas gnômicas, ou qualquer outra coisa que possa ser representada usando textos ou imagens. Um livro com magias é um grimório.'),
      ('Luneta', '1.000 po', '0,5 kg', NULL, 'Objetos vistos através de uma luneta são ampliados até o dobro de seu tamanho.'),
      ('Manto', '1 po', '2 kg', NULL, NULL),
      ('Marreta', '2 po', '5 kg', NULL, NULL),
      ('Martelo', '1 po', '1,5 kg', NULL, NULL),
      ('Mochila', '2 po', '2,5 kg', NULL, 'Capacidade: 30 cm cúbicos de um sólido/15 kg de equipamentos. Você pode prender itens como um saco de dormir e um rolo de corda do lado de fora da mochila.'),
      ('Balas de Funda (20)', '4 pc', '0,75 kg', 'Munição', NULL),
      ('Flechas (20)', '1 po', '0,5 kg', 'Munição', NULL),
      ('Virotes (20)', '1 po', '0,75 kg', 'Munição', NULL),
      ('Zarabatana (50)', '1 po', '0,5 kg', 'Munição', NULL),
      ('Óleo (frasco)', '1 pp', '0,5 kg', NULL, 'Geralmente vem em um frasco de argila que contém 500 ml. Usando uma ação, você pode espirrar o óleo desse frasco em uma criatura a até 1,5 metro de você ou arremessar a até 6 metros, quebrando-o com o impacto. Você deve realizar um ataque à distância contra uma criatura ou objeto, tratando o óleo como uma arma improvisada. Com um sucesso, o alvo é coberto de óleo. Se o alvo sofrer qualquer dano flamejante antes do óleo secar (depois de 1 minuto), a criatura sofre 5 de dano flamejante adicional pela queima do óleo. Você também pode derramar um frasco de óleo no chão para cobrir uma área de um quadrado de 1,5 metro de lado, desde que a superfície esteja nivelada. Se aceso, o óleo queima por 2 rodadas e causa 5 de dano flamejante a qualquer criatura que entrar na área ou terminar seu turno dentro da área. Uma criatura pode sofrer esse dano apenas uma vez por turno.'),
      ('Pá', '2 po', '2,5 kg', NULL, NULL),
      ('Panela de ferro', '2 po', '5 kg', NULL, 'Capacidade: 4 litros'),
      ('Papel (uma folha)', '2 pp', '-', NULL, NULL),
      ('Parafina', '5 pp', '-', NULL, NULL),
      ('Pé de cabra', '2 po', '2,5 kg', NULL, 'Um pé de cabra concede vantagem nos testes de Força onde uma alavanca possa ser aplicada.'),
      ('Pedra de amolar', '1 pc', '-', NULL, NULL),
      ('Perfume (frasco)', '5 po', '-', NULL, NULL),
      ('Pergaminho (uma folha)', '1 pp', '-', NULL, NULL),
      ('Picareta de minerador', '2 po', '5 kg', NULL, NULL),
      ('Píton', '5 pc', '-', NULL, NULL),
      ('Poção de cura', '50 po', '0,25 kg', NULL, 'Um personagem que beer o líquido vermelho mágico deste frasco recupera 2d4+2 pontos de vida. Beber ou administrar uma poção exige uma ação.'),
      ('Porta mapas ou pergaminhos', '1 po', '0,25 kg', NULL, 'Esse estojo cilíndrico de couro pode armazenar até 10 folhas de papel enroladas ou até 5 folhas de pergaminho enroladas.'),
      ('Porta virotes', '1 po', '0,5 kg', NULL, 'Esse estojo de madeira pode armazenar até 20 virotes de besta.'),
      ('Pregos de ferro (10)', '1 po', '2,5 kg', NULL, NULL),
      ('Rações de viagem (1 dia)', '5 pp', '1 kg', NULL, NULL),
      ('Robes', '1 po', '2 kg', NULL, NULL),
      ('Roldana e polia', '1 po', '2,5 kg', NULL, 'Um conjunto de roldanas com um cabo entre elas e um gancho para fixar aos objetos, a roldana e polia permitem içar até quatro vezes o peso que você ergueria normalmente.'),
      ('Roupas comuns', '5 pp', '1,5 kg', NULL, NULL),
      ('Roupas de viajante', '2 po', '2 kg', NULL, NULL),
      ('Roupas de entretenimento', '5 po', '2 kg', NULL, NULL),
      ('Roupas finas', '15 po', '3 kg', NULL, NULL),
      ('Sabão', '2 pc', '-', NULL, NULL),
      ('Saco', '1 pc', '0,25 kg', NULL, 'Capacidade: 30 cm cúbicos de um sólido/13 kg de equipamentos'),
      ('Saco de dormir', '1 po', '3,5 kg', NULL, NULL),
      ('Amuleto', '5 po', '0,5 kg', 'Símbolo sagrado', 'Um símbolo sagrado é a representação de uma divindade ou um panteão. Pode ser uma muleto com o símbolo de uma divindade, um símbolo talhado cuidadosamente ou encrustado como um emblema em um escudo ou até mesmo uma caixa pequena que guarda um fragmento de uma relíquia sagrada. O apêndice B lista os símbolos comumente associados a muitas divindades no multiverso. Um clérigo ou paladino podem usar um símbolo sagrado como um foco de conjuração, como descrito no capítulo 10. Para usar o símbolo dessa forma, o conjurador precisa segurá-lo em uma mão, usa-lo visivelmente ou hostenta-lo em seu escudo.'),
      ('Emblema', '5 po', '-', 'Símbolo sagrado', 'Um símbolo sagrado é a representação de uma divindade ou um panteão. Pode ser uma muleto com o símbolo de uma divindade, um símbolo talhado cuidadosamente ou encrustado como um emblema em um escudo ou até mesmo uma caixa pequena que guarda um fragmento de uma relíquia sagrada. O apêndice B lista os símbolos comumente associados a muitas divindades no multiverso. Um clérigo ou paladino podem usar um símbolo sagrado como um foco de conjuração, como descrito no capítulo 10. Para usar o símbolo dessa forma, o conjurador precisa segurá-lo em uma mão, usa-lo visivelmente ou hostenta-lo em seu escudo.'),
      ('Relicário', '5 po', '1 kg', 'Símbolo sagrado', 'Um símbolo sagrado é a representação de uma divindade ou um panteão. Pode ser uma muleto com o símbolo de uma divindade, um símbolo talhado cuidadosamente ou encrustado como um emblema em um escudo ou até mesmo uma caixa pequena que guarda um fragmento de uma relíquia sagrada. O apêndice B lista os símbolos comumente associados a muitas divindades no multiverso. Um clérigo ou paladino podem usar um símbolo sagrado como um foco de conjuração, como descrito no capítulo 10. Para usar o símbolo dessa forma, o conjurador precisa segurá-lo em uma mão, usa-lo visivelmente ou hostenta-lo em seu escudo.'),
      ('Sinete', '5 po', '-', NULL, NULL),
      ('Sino', '1 po', '-', NULL, NULL),
      ('Tenda para duas pessoas', '2 po', '10 kg', NULL, 'Um abrigo simples e portátil que acomoda duas pessoas.'),
      ('Tocha', '1 pc', '0,5 kg', NULL, 'A tocha queima por 1 hora, fornecendo luz plena em um raio de 6 metros e penumbra por mais 6 metros. Se você realizar um ataque corpo-a-corpo com uma tocha acesa e acertar, causa 1 de dano flamejante.'),
      ('Tinta (frasco de 30 ml)', '10 po', '-', NULL, NULL),
      ('Vara (3 metros)', '5 pc', '3,5 kg', NULL, NULL),
      ('Vela', '1 pc', '3,5 kg', NULL, 'Por uma hora, a vela emana luz plena em um raio de 1,5 metro e penumbra por mais 1,5 metro.'),
      ('Veneno básico (frasco)', '100 po', '-', NULL, 'Você pode usar o veneno contido nesse vidro para cobrir uma lâmina cortante ou perfurante de uma arma ou até três peças de munição. Aplicar o veneno leva uma ação. Uma criatura atingida pela arma ou munição envenenada deve obter sucesso em um teste de resistência de Constituição CD 10 ou sofrerá 1d4 de dano de veneno. Uma vez aplicado, o veneno retém sua potência durante 1 minuto antes de secar.');
    ''';

    return await db.rawInsert(sql);
  }

  // Armor section
  static Future<List<Armor>?> getAllArmor() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Armor", orderBy: 'category ASC, name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Armor.fromJson(maps[index]));
  }

  static Future<int> addAllArmor() async {
    final db = await _getDB();

    String sql = '''
      INSERT INTO Armor (category, name, price, armorClass, weight, strength, stealth)
      VALUES
      ('Leve', 'Acolchoada', '5 po', '11 + Des.', '4 kg', NULL, 'Desvantagem'),
      ('Leve', 'Couro', '10 po', '11 + Des.', '5 kg', NULL, NULL),
      ('Leve', 'Couro Batido', '45 po', '12 + Des.', '6,5 kg', NULL, NULL),
      ('Média', 'Gibão de Peles', '10 po', '12 + Des. (Máximo +2)', '6 kg', NULL, NULL),
      ('Média', 'Camisão de Malha', '30 po', '13 + Des. (Máximo +2)', '10 kg', NULL, NULL),
      ('Média', 'Brunea', '50 po', '14 + Des. (Máximo +2)', '22,5 kg', NULL, 'Desvantagem'),
      ('Média', 'Peitoral', '400 po', '14 + Des. (Máximo +2)', '10 kg', NULL, NULL),
      ('Média', 'Meia-Armadura', '750 po', '15 + Des. (Máximo +2)', '20 kg', NULL, 'Desvantagem'),
      ('Pesada', 'Cota de anéis', '30 po', '15', '20 kg', NULL, 'Desvantagem'),
      ('Pesada', 'Cota de malha', '75 po', '16', '27,5 kg', 'For 13', 'Desvantagem'),
      ('Pesada', 'Cota de talas', '200 po', '17', '30 kg', 'For 15', 'Desvantagem'),
      ('Pesada', 'Placas', '1.500 po', '18', '32,5 kg', 'For 15', 'Desvantagem'),
      ('Escudo', 'Escudo', '10 po', '+2', '3 kg', NULL, NULL);
    ''';

    return await db.rawInsert(sql);
  }

  // Backgrounds section
  static Future<List<Background>?> getAllBackgrounds() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Backgrounds", orderBy: 'name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
        maps.length, (index) => Background.fromJson(maps[index]));
  }

  // Races section
  static Future<List<Race>?> getAllRaces() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Races", orderBy: 'name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Race.fromJson(maps[index]));
  }

  // Subraces section
  static Future<List<Subrace>?> getAllSubraces() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Subraces", orderBy: 'name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Subrace.fromJson(maps[index]));
  }

  // Alignments section
  static Future<List<Alignment>?> getAllAlignments() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Alignments", orderBy: 'name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
        maps.length, (index) => Alignment.fromJson(maps[index]));
  }

  // Skills section
  static Future<List<Skill>?> getAllSkills() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Skills", orderBy: 'name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Skill.fromJson(maps[index]));
  }

  // Character section
  static Future<List<Character>?> getAllCharacters() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps =
        await db.query("Characters", orderBy: 'name ASC');

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(
        maps.length, (index) => Character.fromJson(maps[index]));
  }

  static Future<int> insertCharacter(Character character) async {
    final db = await _getDB();
    return await db.insert('Characters', character.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCharacter(Character character) async {
    final db = await _getDB();
    return await db.update('Character', character.toJson(),
        where: 'id = ?',
        whereArgs: [character.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCharacter(Character character) async {
    final db = await _getDB();
    return await db
        .delete('Character', where: 'id = ?', whereArgs: [character.id]);
  }
}
