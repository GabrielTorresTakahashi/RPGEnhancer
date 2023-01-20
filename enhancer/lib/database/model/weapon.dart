class Weapon {
  final int id;
  final String name;
  final String price;
  final String dice;
  final String damageType;
  final String weaponType;
  final String range;
  final String? properties;

  const Weapon({
    required this.id,
    required this.name,
    required this.price,
    required this.dice,
    required this.damageType,
    required this.weaponType,
    required this.range,
    required this.properties,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price' : price,
      'dice': dice,
      'damageType': damageType,
      'type': weaponType,
      'range': range,
      'attributes': properties,
    };
  }

  @override
  String toString() {
    return 'Weapon{id: $id name: $name price: $price dice: $dice'
        ' damageType: $damageType weaponType: $weaponType range: $range'
        ' attributes: $properties}';
  }
}
