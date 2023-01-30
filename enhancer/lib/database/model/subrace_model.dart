class Subrace {
  final int? id;
  final String name;
  final String abilityScore;
  final String speed;
  final int raceId;
  const Subrace(
      {required this.name,
      required this.abilityScore,
      required this.speed,
      required this.raceId,
      this.id});

  factory Subrace.fromJson(Map<String, dynamic> json) => Subrace(
        id: json['id'],
        name: json['name'],
        abilityScore: json['abilityScore'],
        speed: json['speed'] ?? '',
        raceId: json['raceId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'abilityScore': abilityScore,
        'speed': speed,
        'raceId': raceId,
      };
}
