class Equipment {
  final int? id;
  final String name;
  final String price;
  final String weight;
  final String? category;
  final String? description;

  const Equipment(
      {required this.name,
      required this.price,
      required this.weight,
      this.category,
      this.description,
      this.id});

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      weight: json['weight'],
      category: json['category'],
      description: json['description']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'weight': weight,
        'category': category,
        'description': description
      };
}
