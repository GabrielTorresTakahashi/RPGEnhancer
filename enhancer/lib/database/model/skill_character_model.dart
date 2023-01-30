class SkillCharacter {
  final int? id;
  final int skillId;
  final int characterId;

  SkillCharacter({this.id, required this.skillId, required this.characterId});

  factory SkillCharacter.fromJson(Map<String, dynamic> json) => SkillCharacter(
        id: json['id'],
        skillId: json['skillId'],
        characterId: json['characterId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'skillId': skillId,
        'characterId': characterId,
      };
}
