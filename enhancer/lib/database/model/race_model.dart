class Race {
  final int? id;
  final String name;
  final String abilityScore;
  final String speed;
  final String languages;
  final String traits;
  final int? subraceId;

  const Race(
      {this.id,
      required this.name,
      required this.abilityScore,
      required this.speed,
      required this.languages,
      required this.traits,
      this.subraceId});

  factory Race.fromJson(Map<String, dynamic> json) => Race(
        id: json['id'],
        name: json['name'],
        abilityScore: json['abilityScore'],
        speed: json['speed'],
        languages: json['languages'],
        traits: json['traits'],
        subraceId: json['subraceId'],
      );
}
