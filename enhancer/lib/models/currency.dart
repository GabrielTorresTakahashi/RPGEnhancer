import 'dart:math';

import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class Currency extends StatelessWidget {
  //Retorna um ListTile. Bom pra colocar em ListView
  final Random random = Random();
  final String type;
  final String level;

  Currency({Key? key, required this.type, required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //PILHA
    if (type == 'Pilha') {
      String totalObjects = '';
      String totalCoins = '';

      //PILHA LEVEL 0-4
      if (level == '0-4') {
        final List<String> objects = ['N', 'Gem10', 'Gem50', 'ArtObj25'];
        String lootObj = objects[random.nextInt(objects.length)];
        totalCoins = ((random.nextInt(31) + 6) * 100).toString() +
            ' PC, ' +
            ((random.nextInt(16) + 3) * 100).toString() +
            ' PP, ' +
            ((random.nextInt(11) + 2) * 10).toString() +
            ' PO';

        switch (lootObj) {
          case 'N':
            totalObjects = totalCoins;
            totalCoins = '';
            break;
          case 'Gem10':
            final List<String> gem10 = [
              'Azurita',
              'Agata Malhada',
              'Quartzo azul',
              'Ágata ocular',
              'Hematita',
              'Lápis lazúli',
              'Malaquita',
              'Ágata musgo',
              'Obsidiana',
              'Rodocrosita',
              'Olho de tigre',
              'Turquesa'
            ];
            lootObj = gem10[random.nextInt(gem10.length)];
            totalObjects =
                (random.nextInt(11) + 2).toString() + ' x $lootObj de 10 PO';
            break;
          case 'Gem50':
            final List<String> gem50 = [
              'Pedra de sangue ',
              'Cornalina ',
              'Calcedônia',
              'Crisoprásio',
              'Citrina ',
              'Jaspe',
              'Pedra lunar',
              'Ônix',
              'Quartzo',
              'Sardônica',
              'Quartzo rosa estrela',
              'Zircônio '
            ];
            lootObj = gem50[random.nextInt(gem50.length)];
            totalObjects =
                (random.nextInt(11) + 2).toString() + ' x $lootObj de 50 PO';
            break;
          case 'ArtObj25':
            final List<String> artObj25 = [
              'Jarro de prata',
              'Estatueta esculpida em osso',
              'Bracelete de ouro pequeno',
              'Vestimenta de tecido dourado',
              'Máscara de veludo negra costurada com fios de prata',
              'Cálice de cobre com filigrana prateada',
              'Par de dados de osso com gravuras',
              'Pequeno espelho numa moldura de madeira pintada',
              'Lenço de seda bordado',
              'Broche de ouro com um retrato pintado dentro',
            ];
            lootObj = artObj25[random.nextInt(artObj25.length)];
            totalObjects =
                (random.nextInt(11) + 2).toString() + ' x $lootObj de 25 PO';
            break;
        }
      }
      //PILHA LEVEL 5-10
      if (level == '5-10') {
        List<String> objects = [
          'N',
          'ArtObj25',
          'ArtObj250',
          'Gem50',
          'Gem100'
        ];
        String lootObj = objects[random.nextInt(objects.length)];
        totalCoins = ((random.nextInt(11) + 2) * 100).toString() +
            ' PC, ' +
            ((random.nextInt(11) + 2) * 1000).toString() +
            ' PP, ' +
            ((random.nextInt(31) + 6) * 100).toString() +
            ' PO, ' +
            ((random.nextInt(16) + 3) * 10).toString() +
            ' PL';

        switch (lootObj) {
          case 'N':
            totalObjects = totalCoins;
            totalCoins = '';
            break;
          case 'ArtObj25':
            final List<String> artObj25 = [
              'Jarro de prata',
              'Estatueta esculpida em osso',
              'Bracelete de ouro pequeno',
              'Vestimenta de tecido dourado',
              'Máscara de veludo negra costurada com fios de prata',
              'Cálice de cobre com filigrana prateada',
              'Par de dados de osso com gravuras',
              'Pequeno espelho numa moldura de madeira pintada',
              'Lenço de seda bordado',
              'Broche de ouro com um retrato pintado dentro',
            ];
            lootObj = artObj25[random.nextInt(artObj25.length)];
            totalObjects = (random.nextInt(7)+2).toString()+' x $lootObj de 25 PO';

            break;
          case 'ArtObj250':
            break;
          case 'Gem50':
            final List<String> gem50 = [
              'Pedra de sangue ',
              'Cornalina ',
              'Calcedônia',
              'Crisoprásio',
              'Citrina ',
              'Jaspe',
              'Pedra lunar',
              'Ônix',
              'Quartzo',
              'Sardônica',
              'Quartzo rosa estrela',
              'Zircônio '
            ];

            break;
          case 'Gem100':
            break;
        }
      }
      //PILHA LEVEL 11-16
      if (level == '11-16') {
        List<String> objects = [
          'N',
          'ArtObj250',
          'ArtObj750',
          'Gem500',
          'Gem1000'
        ];
        String lootObj = objects[random.nextInt(objects.length)];
        totalCoins = ((random.nextInt(21) + 4) * 1000).toString() +
            ' PO, ' +
            ((random.nextInt(26) + 5) * 100).toString() +
            ' PL';
      }
      //PILHA LEVEL 17+
      if (level == '17+') {}

      //PILHA DE TESOURO

      return ListTile(
        leading: const FlutterLogo(),
        title: Text(
          totalObjects,
          style: lootText,
        ),
        subtitle: Text(
          totalCoins,
          style: lootText2,
        ),
        onTap: null,
      );
    }
    //INDIVIDUAL
    else {
      String totalCoins =
          'Selecione um Nivel de Tesouro'; //Exibido no Title da ListTile
      ///INDIVIDUAL LEVEL 0-4
      if (level == '0-4') {
        //Esses sao os numeros rolados no D100 para determinar as moedas.
        final List<String> d100 = [
          '01-30',
          '31-60',
          '61-70',
          '71-95',
          '96-100'
        ];
        final String rolled = d100[random.nextInt(d100.length)];

        //Quantidade de moedas totais
        totalCoins = '';
        //calcula parcialmente a quantidade de moedas para jogar no total
        int coins = 0;
        //valida a rolagem
        switch (rolled) {
          case '01-30':
            coins = random.nextInt(30 - 4) + 5;
            totalCoins = coins.toString() + ' PC';
            break;
          case '31-60':
            coins = random.nextInt(24 - 4) + 4;
            totalCoins = coins.toString() + ' PP';
            break;
          case '61-70':
            coins = random.nextInt(18 - 4) + 3;
            totalCoins = coins.toString() + ' PE';
            break;
          case '71-95':
            coins = random.nextInt(18 - 4) + 3;
            totalCoins = coins.toString() + ' PO';
            break;
          case '96-100':
            coins = random.nextInt(6) + 1;
            totalCoins = coins.toString() + ' PL';
            break;
        }
      }

      ///INDIVIDUAL LEVEL 5-10
      if (level == '5-10') {
        final List<String> d100 = [
          '01-30',
          '31-60',
          '61-70',
          '71-95',
          '96-100'
        ];
        final String rolled = d100[random.nextInt(d100.length)];

        totalCoins = '';
        int coins = 0;
        switch (rolled) {
          case '01-30':
            coins = (random.nextInt(24 - 5) + 6) * 100;
            totalCoins = totalCoins + coins.toString() + ' PC, ';

            coins = (random.nextInt(6) + 1) * 10;
            totalCoins = totalCoins + coins.toString() + ' PE';
            break;
          case '31-60':
            coins = (random.nextInt(31) + 6) * 10;
            totalCoins = totalCoins + coins.toString() + ' PP, ';

            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = totalCoins + coins.toString() + ' PO';
            break;
          case '61-70':
            coins = (random.nextInt(16) + 3) * 10;
            totalCoins = totalCoins + coins.toString() + ' PE, ';

            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = totalCoins + coins.toString() + ' PO';
            break;
          case '71-95':
            coins = (random.nextInt(21) + 4) * 10;
            totalCoins = totalCoins + coins.toString() + ' PO';
            break;
          case '96-100':
            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = totalCoins + coins.toString() + ' PO, ';

            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = totalCoins + coins.toString() + ' PL';
            break;
        }
      }

      ///INDIVIDUAL LEVEL 11-16
      if (level == '11-16') {
        final List<String> d100 = ['01-20', '21-35', '36-75', '76-100'];
        final String rolled = d100[random.nextInt(d100.length)];
        totalCoins = '';
        int coins = 0;
        switch (rolled) {
          case '01-20':
            debugPrint(rolled);
            coins = (random.nextInt(24 - 3) + 4) * 100;
            totalCoins = totalCoins + coins.toString() + ' PP, ';

            coins = (random.nextInt(6) + 1) * 100;
            totalCoins = totalCoins + coins.toString() + ' PO';
            break;
          case '21-35':
            coins = (random.nextInt(6) + 1) * 100;
            totalCoins = totalCoins + coins.toString() + ' PE, ';

            coins = (random.nextInt(6) + 1) * 100;
            totalCoins = totalCoins + coins.toString() + ' PO';
            break;
          case '36-75':
            coins = (random.nextInt(11) + 2) * 100;
            totalCoins = totalCoins + coins.toString() + ' PO, ';

            coins = (random.nextInt(6) + 1) * 10;
            totalCoins = totalCoins + coins.toString() + ' PL';
            break;
          case '76-100':
            coins = (random.nextInt(11) + 2) * 100;
            totalCoins = totalCoins + coins.toString() + ' PO, ';

            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = totalCoins + coins.toString() + ' PL';
            break;
        }
      }

      ///INDIVIDUAL LEVEL 17+
      if (level == '17+') {
        final List<String> d100 = ['1-15', '16-55', '56-100'];
        final String rolled = d100[random.nextInt(d100.length)];
        totalCoins = '';
        int coins = 0;
        switch (rolled) {
          case '1-15':
            coins = (random.nextInt(11) + 2) * 1000;
            totalCoins = totalCoins + coins.toString() + ' PE, ';

            coins = (random.nextInt(41) + 8) * 100;
            totalCoins = totalCoins + coins.toString() + ' PO';
            break;
          case '16-55':
            coins = (random.nextInt(6) + 1) * 1000;
            totalCoins = totalCoins + coins.toString() + ' PO, ';

            coins = (random.nextInt(6) + 1) * 100;
            totalCoins = totalCoins + coins.toString() + ' PL';
            break;
          case '56-100':
            coins = (random.nextInt(6) + 1) * 1000;
            totalCoins = totalCoins + coins.toString() + ' PO, ';

            coins = (random.nextInt(11) + 2) * 100;
            totalCoins = totalCoins + coins.toString() + ' PL';
            break;
        }
      }

      ///TESOURO INDIVIDUAL
      return ListTile(
        leading: const Icon(Icons.attach_money, size: 45, color: Colors.amber),
        title: Text(
          totalCoins,
          style: lootText,
        ),
        subtitle: Text(
          'Individual',
          style: lootText2,
        ),
      );
    }
  }
}
