import 'dart:math';

import 'package:flutter/material.dart';

import '../settings/text_style.dart';

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
    late List<String> nicknames = [' '];
    switch (race) {
      case '-Raça-':
      names = [''];
      lastNames = names;
        break;
      case 'Gnomo':
        if (gender == 'Feminino') {
          names = [
            'Bimpnottin',
            'Breena',
            'Caramip',
            'Carlin',
            'Donella',
            'Duvamil',
            'Ella',
            'Ellyjobell',
            'Ellywick',
            'Lilli',
            'Loopmottin',
            'Lorilla',
            'Mardnab',
            'Nissa',
            'Nyx',
            'Oda',
            'Orla',
            'Roywyn',
            'Shamil',
            'Tana',
            'Waywocket',
            'Zanna',
          ];
        } else {
          names = [
            'Alston',
            'Alvyn',
            'Boddynock',
            'Brocc',
            'Burgell',
            'Dimble',
            'Eldon',
            'Erky',
            'Fonkin',
            'Frug',
            'Gerbo',
            'Gimble',
            'Glim',
            'Jebeddo',
            'Kellen',
            'Namfoodle',
            'Orryn',
            'Roondar',
            'Seebo',
            'Sindri',
            'Warryn',
            'Wrenn',
            'Zook',
          ];
        }
        nicknames = [
          ' "Beberrão" ',
          ' "Pó de Coração" ',
          ' "Texugo" ',
          ' "Manto" ',
          ' "Tranca-Dupla" ',
          ' "Bate-Carteira" ',
          ' "Fnipper" ',
          ' "Ku" ',
          ' "Nim" ',
          ' "Um Sapato" ',
          ' "Pústula" ',
          ' "Gema Faiscante" ',
          ' "Pato Desajeitado" ',
        ];
        lastNames = [
          'Beren',
          'Daergel',
          'Folkor',
          'Garrick',
          'Nackle',
          'Murnig',
          'Ningel',
          'Raulnor',
          'Scheppen',
          'Timbers',
          'Turen',
        ];

        break;
      case 'Humano':
        if (gender == 'Feminino') {
        } else {
          names = ['Aseir', 'Bardeid', 'Haseid'];
        }
        lastNames = ['Bashta', 'Dumein', 'Jassan'];
        break;
      case 'Elfo':
        if (gender == 'Feminino') {
          names = [
            'Adrie',
            'Althaea',
            'Anastrianna',
            'Andraste',
            'Antinua',
            'Bethrynna',
            'Birel',
            'Caelynn',
            'Drusilia',
            'Enna',
            'Felosial',
            'Ielenia',
            'Jelenneth',
            'Keyleth',
            'Leshanna',
            'Lia',
            'Meriele',
            'Mialee',
            'Naivara',
            'Quelenna',
            'Quillathe',
            'Sariel',
            'Shanairra',
            'Shava',
            'Silaqui',
            'Theirastra',
            'Thia',
            'Vadania',
            'Valanthe',
            'Xanaphia'
          ];
        } else {
          names = [
            'Adran',
            'Aelar',
            'Aramil',
            'Arannis',
            'Aust',
            'Beiro',
            'Berrian',
            'Carric',
            'Enialis',
            'Erdan',
            'Erevan',
            'Galinndan',
            'Hadarai',
            'Heian',
            'Himo',
            'Immeral',
            'Ivellios',
            'Laucian',
            'Mindartis',
            'Paelias',
            'Peren',
            'Quarion',
            'Riardon',
            'Rolen',
            'Soveliss',
            'Thamior',
            'Tharivol',
            'Theren',
            'Varis',
          ];
        }
        lastNames = [
          'Amakiir (Joia Florida)',
          'Amastacia (Flor das Estrelas)',
          'Galanodel (Sussurro da Lua)',
          'Holimion (Orvalho dos Diamantes)',
          'Ilphelkiir (Pétala Preciosa)',
          'Liadon (Folha de Prata)',
          'Meliamne (Calcanhar de Carvalho)',
          'Nailo (Brisa da Noite)',
          'Siannodel (Córrego Lunar)',
          'Xiloscient (Pétala de Ouro)',
        ];
        break;
      case 'Anão':
        if (gender == 'Feminino') {
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
        if (gender == 'Feminino') {
          names = [
            'Andry',
            'Bree',
            'Callie',
            'Cora',
            'Euphemia',
            'Jillian',
            'Kithri',
            'Lavinia',
            'Lidda',
            'Merla',
            'Nedda',
            'Paela',
            'Portia',
            'Seraphina',
            'Shaena',
            'Trym',
            'Vani',
            'Verna'
          ];
        } else {
          names = [
            'Alton',
            'Ander,Cade',
            'Corrin',
            'Eldon',
            'Errich',
            'Finnan',
            'Garret',
            'Lindal',
            'Lyle',
            'Merric',
            'Milo',
            'Osborn',
            'Perrin',
            'Reed',
            'Roscoe',
            'Wellby'
          ];
        }
        lastNames = [
          'Cata-Escovas',
          'Bom-Barril',
          'Garrafa Verde',
          'Alta Colina',
          'Baixa Colina',
          'Prato Cheio',
          'Folha de Chá',
          'Espinhudo',
          'Cinto Frouxo',
          'Galho Caído',
        ];

        break;
      case 'Draconato':
        if (gender == 'Feminino') {
          names = [
            'Akra',
            'Biri',
            'Daar',
            'Farideh',
            'Harann',
            'Flavilar',
            'Jheri',
            'Kava',
            'Korinn',
            'Mishann',
            'Nala',
            'Perra',
            'Raiann',
            'Sora',
            'Surina',
            'Thava',
            'Uadjit',
          ];
        } else {
          names = [
            'Arjhan',
            'Balasar',
            'Bharash',
            'Donaar',
            'Ghesh',
            'Heskan',
            'Kriv',
            'Medrash',
            'Mehen',
            'Nadarr',
            'Pandjed',
            'Patrin',
            'Rhogar',
            'Shamash',
            'Shedinn',
            'Tarhun',
            'Torinn',
          ];
        }
        lastNames = [
          'Clethtinthiallor',
          'Daardendrian',
          'Delmirev',
          'Drachedandion',
          'Fenkenkabradon',
          'Kepeshkmolik',
          'Kerrhylon',
          'Kimbatuul',
          'Linxakasendalor',
          'Myastan',
          'Nemmonis',
          'Norixius',
          'Ophinshtalajiir',
          'Prexijandilin',
          'Shestendeliath',
          'Turnuroth',
          'Verthisathurgiesh',
          'Yarjerit',
        ];
        break;
      case 'Tiefling':
        if (gender == 'Feminino') {
          names = [];
        } else {
          names = [];
        }
        break;
    }
    fullName = names[random.nextInt(names.length)] +
        nicknames[random.nextInt(nicknames.length)] +
        lastNames[random.nextInt(lastNames.length)];

    return Text(fullName, style: lootText);
  }
}
