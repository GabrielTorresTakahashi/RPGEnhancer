import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../settings/text_style.dart';

class NameGenerator extends StatelessWidget {
  final String race;
  final String gender;
  final bool placeholder;
  const NameGenerator(
      {Key? key,
      required this.race,
      required this.gender,
      this.placeholder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    late final List<String> names;
    late final List<String> lastNames;
    List<Color> iconColor = [Colors.transparent];
    String fullName = '';
    if (placeholder) {
      fullName = 'Selecione Raça e Gênero';
    }
    late List<String> nicknames = [' '];
    if (gender != '-Gênero-' && race != '-Raça') {
      iconColor = [
        Colors.white,
        Colors.blue,
        Colors.amber,
        Colors.purple,
        Colors.pink,
        Colors.teal,
        Colors.cyan,
        Colors.green,
        Colors.lightGreen
      ];
      switch (race) {
        case '-Raça-':
          names = [''];
          lastNames = names;
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
          }
          if (gender == 'Masculino') {
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
          }
          if (gender == 'Masculino') {
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
          }
          if (gender == 'Masculino') {
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
          }
          if (gender == 'Masculino') {
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
        case 'Humano':
          if (gender == 'Feminino') {
            names = [
              'Atala',
              'Ceidil',
              'Hama',
              'Jasmal',
              'Meilil',
              'Seipora',
              'Yasheira',
              'Zasheida',
              'Arveene',
              'Esvele',
              'Jhessail',
              'Kerri',
              'Lureene',
              'Miri',
              'Rowan',
              'Shandri',
              'Tessele',
              'Alethra',
              'Kara',
              'Katernin',
              'Mara',
              'Natali',
              'Olma',
              'Tana',
              'Zora',
              'Amafrey',
              'Betha',
              'Cefrey',
              'Kethra',
              'Mara',
              'Olga',
              'Silifrey',
              'Westra',
              'Arizima',
              'Chathi',
              'Nephis',
              'Nulara',
              'Murithi',
              'Sefris',
              'Thola',
              'Umara',
              'Zolis',
              'Fyevarra',
              'Hulmarra',
              'Immith',
              'Imzel',
              'Navarra',
              'Shevarra',
              'Tammith',
              'Yuldra',
              'Bai',
              'Chao',
              'Jia',
              'Lei',
              'Mei',
              'Qiao',
              'Shui',
              'Tai',
              'Balama',
              'Dona',
              'Faila',
              'Jalana',
              'Luisa',
              'Marta',
              'Quara',
              'Selise',
              'Vonda',
            ];
          }
          if (gender == 'Masculino') {
            names = [
              'Aseir',
              'Bardeid',
              'Haseid',
              'Khemed',
              'Mehmen',
              'Sudeiman',
              'Zasheir',
              'Darvin',
              'Dorn',
              'Evendur',
              'Gorstag',
              'Grim',
              'Helm',
              'Malark',
              'Morn',
              'Randal',
              'Stedd',
              'Bor',
              'Fodel',
              'Glar',
              'Grigor',
              'Igan',
              'Ivor',
              'Kosef',
              'Mival',
              'Orel',
              'Pavel',
              'Sergor',
              'Ander',
              'Blath',
              'Bran',
              'Frath',
              'Geth',
              'Lander',
              'Luth',
              'Malcer',
              'Stor',
              'Taman',
              'Urth',
              'Aoth',
              'Bareris',
              'Ehput-Ki',
              'Kethoth',
              'Mumed',
              'Ramas',
              'So-Kehur',
              'Thazar-De',
              'Urhur',
              'Borivik',
              'Faurgar',
              'Jandar',
              'Kanithar',
              'Madislak',
              'Ralmevik',
              'Shaumar',
              'Vladislak',
              'Anton',
              'Diero',
              'Marcon',
              'Pieron',
              'Rimardo',
              'Romero',
              'Salazar',
              'Umbero',
            ];
          }
          lastNames = [
            'Basha',
            'Dumein',
            'Jassan',
            'Khalid',
            'Mostana',
            'Pashar',
            'Rein',
            'Amblecrown',
            'Buckman',
            'Dundragon',
            'Evenwood',
            'Greycastle',
            'Tallstag',
            'Bersk',
            'Chernin',
            'Dotsk',
            'Kulenov',
            'Marsk',
            'Nemetsk',
            'Shemov',
            'Starag',
            'Brightwood',
            'Helder',
            'Hornraven',
            'Lackman',
            'Stormwind',
            'Windrivver',
            'Ankhalab',
            'Anskuld',
            'Fezim',
            'Hahpet',
            'Nathandem',
            'Sepret',
            'Uuthrakt',
            'Chergoba',
            'Dyernina',
            'Iltazyara',
            'Murnyethara',
            'Stayanoga',
            'Ulmokina',
            'Chien',
            'Huang',
            'Kao',
            'Kung',
            'Lao',
            'Ling',
            'Mei',
            'Pin',
            'Shin',
            'Sum',
            'Tan',
            'Wan',
            'Agosto',
            'Astorio',
            'Calabra',
            'Domine',
            'Falone',
            'Marivaldi',
            'Pisacar',
            'Ramondo',
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
          }
          if (gender == 'Masculino') {
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
        case 'Orc (Meio-Orc)':
          if (gender == 'Masculino') {
            names = [
              'Dench',
              'Feng',
              'Gell',
              'Henk',
              'Holg',
              'Imsh',
              'Keth',
              'Krusk',
              'Mhurren',
              'Ront',
              'Shump',
              'Thokk',
            ];
          }
          if (gender == 'Feminino') {
            names = [
              'Baggi',
              'Emen',
              'Engong',
              'Kansif',
              'Myev',
              'Neega',
              'Ovak',
              'Ownka',
              'Shautha',
              'Sutha',
              'Vola',
              'Volen',
              'Yevelda',
            ];
          }
          lastNames = names;
          break;
        case 'Tiefling':
          if (gender == 'Feminino') {
            names = ['Not Yet'];
          } else {
            names = ['Not yet'];
          }
          lastNames = ['Not Yet'];
          break;
      }
      fullName = names[random.nextInt(names.length)] +
          nicknames[random.nextInt(nicknames.length)] +
          lastNames[random.nextInt(lastNames.length)];
    }
    return ListTile(
        leading: Icon(FontAwesomeIcons.person,
            size: 35, color: iconColor[random.nextInt(iconColor.length)]),
        title: Text(fullName, style: nameText));
  }
}
