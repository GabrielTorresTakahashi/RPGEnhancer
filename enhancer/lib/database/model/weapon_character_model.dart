class WeaponCharacter {
  final int? id;
  final int weaponId;
  final int characterId;

  WeaponCharacter({this.id, required this.weaponId, required this.characterId});

  factory WeaponCharacter.fromJson(Map<String, dynamic> json) =>
      WeaponCharacter(
        id: json['id'],
        weaponId: json['weaponId'],
        characterId: json['characterId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'weaponId': weaponId,
        'characterId': characterId,
      };
}
