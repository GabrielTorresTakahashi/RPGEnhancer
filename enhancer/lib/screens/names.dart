import 'dart:math';

import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Nomes")),
        body: NameGenerator(
          race: 'Anão',
          gender: 'M',
        ));
  }
}

class NameGenerator extends StatelessWidget {
  final String race;
  final String gender;
  final Random random = Random();
  late final List<String> names;
  late final String fullName;
  late final List<String> lastNames;

  NameGenerator({Key? key, required this.race, required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (race) {
      case 'Humano':
        if (gender == 'F') {
        } else {
          names = ['Aseir', 'Bardeid', 'Haseid'];
        }
        lastNames = ['Bashta', 'Dumein', 'Jassan'];
        break;
      case 'Elfo':
        names = ['Adran', 'Aelar', 'Aramil'];
        lastNames = ['Folha-de-Prata', 'Jóia Florida', 'Flor Estrelar'];
        break;
      case 'Anão':
        if (gender == 'F') {
          names = [
            'Amber',
            'Artin',
            'Audhild',
            'Bardryn',
            'Dagnal',
            'Diesa',
            'Eldeth',
            'Falkrunn',
            'Gunnloda',
            'Gurdis',
            'Helja',
            'Hlin',
            'Kathra',
            'Kristyd',
            'Ilde',
            'Liftrasa',
            'Madred',
            'Riswynn',
            'Senil',
            'Torbera',
            'Torgga',
            'Vistra'
          ];
        } else {
          names = [
            'Adrik',
            'Alberich',
            'Baern',
            'Barendd',
            'Brottor',
            'Bruenor',
            'Dain',
            'Darrak',
            'Delg',
            'Eberk',
            'Einkil',
            'Fargrim',
            'Flint',
            'Gardon',
            'Harbek',
            'Kildrak',
            'Morgran',
            'Orsik',
            'Oskar',
            'Rangrim',
            'Rurik',
            'Taklinn',
            'Thoradin',
            'Thorin',
            'Tordek',
            'Traubon',
            'Travok',
            'Ulfgar',
            'Veit',
            'Vondal'
          ];
        }
        lastNames = [
          'Balderk',
          'Battlehammer',
          'Brawnanvil',
          'Dankil',
          'Fireforge',
          'Frostbeard',
          'Gorunn',
          'Hikderhej',
          'Ironfist',
          'Loderr',
          'Lutgehr',
          'Rumnaheim',
          'Strakeln',
          'Torunn',
          'Ungart'
        ];
        break;
      case 'Halfling':
        names = ['Alton', 'Ander', 'Cadê'];
        lastNames = ['Cata-Escovas', 'Bom-Barril', 'Garrafa-Verde'];
        break;
    }
    fullName = names[random.nextInt(names.length)] +
        " " +
        lastNames[random.nextInt(lastNames.length)];

    return Text(fullName, style: lootText);
  }
}
