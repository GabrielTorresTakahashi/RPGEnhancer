class Armor {
  final int? id;
  final String category;
  final String name;
  final String price;
  final String armorClass;
  final String weight;
  final String? strength;
  final String? stealth;

  const Armor({
    required this.category,
    required this.name,
    required this.price,
    required this.armorClass,
    required this.weight,
    this.strength,
    this.stealth,
    this.id,
  });

  factory Armor.fromJson(Map<String, dynamic> json) => Armor(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      price: json['price'],
      armorClass: json['armorClass'],
      weight: json['weight'],
      strength: json['strength'],
      stealth: json['stealth']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'name': name,
        'price': price,
        'armorClass': armorClass,
        'weight': weight,
        'strength': strength,
        'stealth': stealth,
      };
}
