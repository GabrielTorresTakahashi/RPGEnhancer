class Subrace {
  final int? id;
  final String name;
  final String abilityScore;
  final String? traits;

  const Subrace(
      {required this.name,
      required this.abilityScore,
      this.traits = "",
      this.id});

  factory Subrace.fromJson(Map<String, dynamic> json) => Subrace(
        id: json['id'],
        name: json['name'],
        abilityScore: json['abilityScore'],
        traits: json['traits'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'abilityScore': abilityScore,
        'traits': traits,
      };
}
