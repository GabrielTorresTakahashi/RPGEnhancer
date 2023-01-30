class Trait {
  final int? id;
  final String title;
  final String description;

  const Trait({
    this.id,
    required this.description,
    required this.title,
  });

  factory Trait.fromJson(Map<String, dynamic> json) =>
      Trait(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
