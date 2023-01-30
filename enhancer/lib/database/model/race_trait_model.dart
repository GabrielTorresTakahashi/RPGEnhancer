class RaceTrait {
  final int? id;
  final int raceId;
  final int traitId;

  RaceTrait({this.id, required this.raceId, required this.traitId});

  factory RaceTrait.fromJson(Map<String, dynamic> json) => RaceTrait(
        id: json['id'],
        raceId: json['raceId'],
        traitId: json['traitId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'raceId': raceId,
        'traitId': traitId,
      };
}
