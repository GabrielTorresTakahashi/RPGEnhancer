class Weapon {
  final int? id;
  final String name;
  final String price;
  final String damage;
  final String weight;
  final String properties;
  final String range;
  final String type;

  const Weapon(
      {required this.name,
      required this.price,
      required this.damage,
      required this.weight,
      required this.properties,
      required this.range,
      required this.type,
      this.id});

  factory Weapon.fromJson(Map<String, dynamic> json) => Weapon(
        id: json['id'],
        name: json['name'],
        damage: json['damage'],
        price: json['price'],
        weight: json['weight'],
        properties: json['properties'],
        range: json['range'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'damage': damage,
        'price': price,
        'weight': weight,
        'properties': properties
      };
}
