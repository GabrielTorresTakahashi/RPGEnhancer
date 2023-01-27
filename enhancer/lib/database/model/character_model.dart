class Character {
  final int? id;
  // Top details
  final String name;
  // Vocation, AKA. class, one or many per character, not referenced here
  final int level;
  final int? backgroundId; // Only one per character
  final int raceId; // Only one per character
  final int? subraceId; // zero or one per character
  final int? alignmentId; // Only one per character
  final int? xp;

  // Abilities
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  // Saving Throws - many per character, not referenced here.
  // Skills - many per character, not referenced here.

  final String? otherProficiencies;
  final String? languages;

  final String? speed;
  final int hp;
  final int? tempHp;
  // Weapons - many per character, not referenced here.
  final String? equipment;
  final int pl;
  final int gp;
  final int ep;
  final int sp;
  final int cp;

  final String? personality;
  final String? ideals;
  final String? bonds;
  final String? flaws;
  final String? traits;

  final int? age;
  final String? height;
  final String? weight;
  final String? eyes;
  final String? skin;
  final String? hair;

  final String? alliesOrganizations;
  final String? characterHistory;
  final String? additionalTraits;
  final String? treasure;

  //Spells - many per character, not referenced here

  const Character({
    this.id,
    required this.name,
    required this.raceId,
    this.speed,
    this.hp = 0,
    this.pl = 0,
    this.gp = 0,
    this.ep = 0,
    this.sp = 0,
    this.cp = 0,
    this.level = 1,
    this.strength = 10,
    this.dexterity = 10,
    this.constitution = 10,
    this.intelligence = 10,
    this.wisdom = 10,
    this.charisma = 10,
    this.backgroundId,
    this.subraceId,
    this.alignmentId,
    this.xp,
    this.otherProficiencies,
    this.languages,
    this.personality,
    this.ideals,
    this.bonds,
    this.flaws,
    this.traits,
    this.age,
    this.height,
    this.weight,
    this.eyes,
    this.skin,
    this.hair,
    this.alliesOrganizations,
    this.characterHistory,
    this.additionalTraits,
    this.treasure,
    this.tempHp,
    this.equipment,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        raceId: json['raceId'],
        speed: json['speed'],
        hp: json['hp'],
        pl: json['pl'],
        gp: json['gp'],
        ep: json['ep'],
        sp: json['sp'],
        cp: json['cp'],
        level: json['level'],
        strength: json['strength'],
        dexterity: json['dexterity'],
        constitution: json['constitution'],
        intelligence: json['intelligence'],
        wisdom: json['wisdom'],
        charisma: json['charisma'],
        backgroundId: json['backgroundId'],
        subraceId: json['subraceId'],
        alignmentId: json['alignmentId'],
        xp: json['xp'],
        otherProficiencies: json['otherProficiencies'],
        languages: json['languages'],
        personality: json['personality'],
        ideals: json['ideals'],
        bonds: json['bonds'],
        flaws: json['flaws'],
        traits: json['traits'],
        age: json['age'],
        height: json['height'],
        weight: json['weight'],
        eyes: json['eyes'],
        skin: json['skin'],
        hair: json['hair'],
        alliesOrganizations: json['alliesOrganizations'],
        characterHistory: json['characterHistory'],
        additionalTraits: json['additionalTraits'],
        treasure: json['treasure'],
        tempHp: json['tempHp'],
        equipment: json['equipment'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'raceId': raceId,
        'speed': speed,
        'hp': hp,
        'pl': pl,
        'gp': gp,
        'ep': ep,
        'sp': sp,
        'cp': cp,
        'level': level,
        'strength': strength,
        'dexterity': dexterity,
        'constitution': constitution,
        'intelligence': intelligence,
        'wisdom': wisdom,
        'charisma': charisma,
        'backgroundId': backgroundId,
        'subraceId': subraceId,
        'alignmentId': alignmentId,
        'xp': xp,
        'otherProficiencies': otherProficiencies,
        'languages': languages,
        'personality': personality,
        'ideals': ideals,
        'bonds': bonds,
        'flaws': flaws,
        'traits': traits,
        'age': age,
        'height': height,
        'weight': weight,
        'eyes': eyes,
        'skin': skin,
        'hair': hair,
        'alliesOrganizations': alliesOrganizations,
        'characterHistory': characterHistory,
        'additionalTraits': additionalTraits,
        'treasure': treasure,
        'tempHp': tempHp,
        'equipment': equipment
      };
}
