class Equipment {
  final int? id;
  final String name;
  final String price;
  final String weight;
  final String? group;
  final String? description;

  const Equipment(
      {required this.name,
      required this.price,
      required this.weight,
      this.group,
      this.description,
      this.id});

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      weight: json['weight'],
      group: json['group'],
      description: json['description']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'weight': weight,
        'group': group,
        'description': description
      };
}
