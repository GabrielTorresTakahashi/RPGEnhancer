class Background {
  final int? id;
  final String name;
  final String trait;
  final String description;
  final String? skills;
  final String? tools;
  final String? languages;
  final String? equipment;

  const Background(
      {this.id,
      required this.description,
      required this.name,
      required this.trait,
      this.skills,
      this.tools,
      this.languages,
      this.equipment});

  factory Background.fromJson(Map<String, dynamic> json) => Background(
        id: json['id'],
        description: json['description'],
        name: json['name'],
        trait: json['trait'],
        skills: json['skills'],
        tools: json['tools'],
        languages: json['languages'],
        equipment: json['equipment'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'name': name,
        'trait': trait,
        'tools': tools,
        'languages': languages,
        'equipment': equipment,
      };
}
