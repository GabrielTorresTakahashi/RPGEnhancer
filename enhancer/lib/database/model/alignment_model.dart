class CharacterAlignment {
  final int? id;
  final String name;
  final String alias;

  const CharacterAlignment({
    this.id,
    required this.alias,
    required this.name,
  });

  factory CharacterAlignment.fromJson(Map<String, dynamic> json) =>
      CharacterAlignment(
        id: json['id'],
        name: json['name'],
        alias: json['alias'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'alias': alias,
      };
}
