class Skill {
  final int? id;
  final String name;
  final String ability;

  Skill({this.id, required this.name, required this.ability});

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json['id'],
        name: json['name'],
        ability: json['ability'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ability': ability,
      };
}
