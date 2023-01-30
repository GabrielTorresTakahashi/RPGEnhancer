class SkillBackground {
  final int? id;
  final int skillId;
  final int backgroundId;

  SkillBackground({this.id, required this.skillId, required this.backgroundId});

  factory SkillBackground.fromJson(Map<String, dynamic> json) =>
      SkillBackground(
        id: json['id'],
        skillId: json['skillId'],
        backgroundId: json['backgroundId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'skillId': skillId,
        'backgroundId': backgroundId,
      };
}
