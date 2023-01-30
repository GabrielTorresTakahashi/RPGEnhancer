class Alignment {
  final int? id;
  final String name;
  final String alias;

  const Alignment({
    this.id,
    required this.alias,
    required this.name,
  });

  factory Alignment.fromJson(Map<String, dynamic> json) => Alignment(
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
