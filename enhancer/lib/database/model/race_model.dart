class Race {
  final int? id;
  final String name;
  final String abilityScore;
  final String speed;
  final String languages;
  final String? darkVision;
  final String? alignment;
  final String? age;
  final String? size;

  const Race({
    this.id,
    required this.name,
    required this.abilityScore,
    required this.speed,
    required this.languages,
    this.darkVision,
    this.alignment,
    this.age,
    this.size,
  });

  factory Race.fromJson(Map<String, dynamic> json) => Race(
        id: json['id'],
        name: json['name'],
        abilityScore: json['abilityScore'],
        speed: json['speed'],
        languages: json['languages'],
        darkVision: json['darkVision'],
        alignment: json['alignment'],
        age: json['age'],
        size: json['size'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'abilityScore': abilityScore,
        'speed': speed,
        'languages': languages,
        'darkVision': darkVision,
        'alignment': alignment,
        'age': age,
        'size': size,
      };
}
