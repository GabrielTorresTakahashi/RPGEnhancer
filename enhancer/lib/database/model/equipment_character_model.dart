class EquipmentCharacter {
  final int? id;
  final int equipmentId;
  final int backgroundId;

  EquipmentCharacter({this.id, required this.equipmentId, required this.backgroundId});

  factory EquipmentCharacter.fromJson(Map<String, dynamic> json) =>
      EquipmentCharacter(
        id: json['id'],
        equipmentId: json['equipmentId'],
        backgroundId: json['backgroundId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'equipmentId': equipmentId,
        'backgroundId': backgroundId,
      };
}