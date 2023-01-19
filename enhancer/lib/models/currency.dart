import 'dart:math';

import 'package:enhancer/models/magic_item.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      String totalObjects = 'Selecione um Nível de Tesouro';
      String totalCoins = 'Pilha de Tesouro';
      List<String> magicItem = [''];

      //PILHA LEVEL 0-4
      if (level == '0-4') {
        magicItem = ['', 'A', 'B', 'C', 'F', 'G'];
        final List<String> objects = ['N', 'Gem10', 'Gem50', 'ArtObj25'];
        String lootObj = objects[random.nextInt(objects.length)];
        totalCoins = '${(random.nextInt(31) + 6) * 100} PC, ${(random.nextInt(16) + 3) * 100} PP, ${(random.nextInt(11) + 2) * 10} PO';

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
                '${random.nextInt(11) + 2} x $lootObj de 10 PO';
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
                '${random.nextInt(11) + 2} x $lootObj de 50 PO';
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
                '${random.nextInt(11) + 2} x $lootObj de 25 PO';
            break;
        }
      }
      //PILHA LEVEL 5-10
      if (level == '5-10') {
        magicItem = ['', 'A', 'B', 'C', 'D', 'F', 'G', 'H'];
        List<String> objects = [
          'N',
          'ArtObj25',
          'ArtObj250',
          'Gem50',
          'Gem100'
        ];
        String lootObj = objects[random.nextInt(objects.length)];
        totalCoins = '${(random.nextInt(11) + 2) * 100} PC, ${(random.nextInt(11) + 2) * 1000} PP, ${(random.nextInt(31) + 6) * 100} PO, ${(random.nextInt(16) + 3) * 10} PL';

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
            totalObjects =
                '${random.nextInt(7) + 2} x $lootObj de 25 PO';

            break;
          case 'ArtObj250':
            final List<String> artObj250 = [
              'Anel de ouro cravejado com pedras de sangue',
              'Estatueta esculpida em marfim',
              'Bracelete de ouro largo',
              'Gargantilha de prata com um pingente de pedra preciosa',
              'Coroa de bronze',
              'Robe de seda com adornos de ouro',
              'Grande tapeçaria elegante',
              'Caneca de bronze com jades incrustadas',
              'Caixa de miniaturas de animais em turquesa',
              'Gaiola de pássaro de ouro com filigrana de electro',
            ];
            lootObj = artObj250[random.nextInt(artObj250.length)];
            totalObjects =
                '${random.nextInt(7) + 2} x $lootObj de 250 PO';
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
                '${random.nextInt(16) + 3} x $lootObj de 50 PO';
            break;
          case 'Gem100':
            final List<String> gem100 = [
              'Âmbar',
              'Ametista ',
              'Crisoberilo ',
              'Coral ',
              'Granada ',
              'Jade ',
              'Jato ',
              'Pérola ',
              'Espinela ',
              'Turmalina ',
            ];
            lootObj = gem100[random.nextInt(gem100.length)];
            totalObjects =
                '${random.nextInt(16) + 3} x $lootObj de 100 PO';
            break;
        }
      }
      //PILHA LEVEL 11-16
      if (level == '11-16') {
        magicItem = ['', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
        List<String> objects = [
          'N',
          'ArtObj250',
          'ArtObj750',
          'Gem500',
          'Gem1000'
        ];
        String lootObj = objects[random.nextInt(objects.length)];
        totalCoins = '${(random.nextInt(21) + 4) * 1000} PO, ${(random.nextInt(26) + 5) * 100} PL';

        switch (lootObj) {
          case 'N':
            totalObjects = totalCoins;
            totalCoins = '';
            break;
          case 'ArtObj250':
            List<String> artObj250 = [
              'Anel de ouro cravejado com pedras de sangue',
              'Estatueta esculpida em marfim',
              'Bracelete de ouro largo',
              'Gargantilha de prata com um pingente de pedra preciosa',
              'Coroa de bronze',
              'Robe de seda com adornos de ouro',
              'Grande tapeçaria elegante',
              'Caneca de bronze com jades incrustadas',
              'Caixa de miniaturas de animais em turquesa',
              'Gaiola de pássaro de ouro com filigrana de electro',
            ];
            String lootObj = artObj250[random.nextInt(artObj250.length)];
            totalObjects =
                '${random.nextInt(7) + 2} x $lootObj de 250 PO';
            break;
          case 'ArtObj750':
            List<String> artObj750 = [
              'Cálice de prata cravejado com pedras da lua',
              'Espada longa de lâmina prateada com conjunto de jatos no cabo',
              'Harpa de madeira exótica com marfim incrustado e gemas de zircónio',
              'Pequeno ídolo de ouro',
              'Pente de ouro em formato de dragão cravejada com granadas vermelhas nos olhos',
              'Rolha de garrafa gravada com folhas de ouro e cravejada com ametistas',
              'Adaga de electro cerimonial com uma pérola negra no pomo',
              'Broche de prata e ouro',
              'Estatueta de obsidiana com detalhes e incrustações de ouro',
              'Máscara de guerra de ouro pintada',
            ];
            String lootObj = artObj750[random.nextInt(artObj750.length)];
            totalObjects =
                '${random.nextInt(7) + 2} x $lootObj de 750 PO';
            break;
          case 'Gem500':
            List<String> gem500 = [
              'Alexandrita',
              'Água-marinha',
              'Pérola negra',
              'Espinela azul',
              'Peridoto',
              'Topázio',
            ];
            String lootObj = gem500[random.nextInt(gem500.length)];
            totalObjects =
                '${random.nextInt(16) + 3} x $lootObj de 500 PO';

            break;
          case 'Gem1000':
            List<String> gem1000 = [
              'Opala negra',
              'Safira azul',
              'Esmeralda',
              'Opala de fogo',
              'Opala',
              'Rubi estrela',
              'Safira estrela',
              'Safira amarela',
            ];
            String lootObj = gem1000[random.nextInt(gem1000.length)];
            totalObjects =
                '${random.nextInt(16) + 3} x $lootObj de 1.000 PO';
            break;
        }
      }
      //PILHA LEVEL 17+
      if (level == '17+') {
        magicItem = ['', 'C', 'D', 'E', 'G', 'H', 'I'];
        List<String> objects = [
          'N',
          'ArtObj2500', // 1d10
          'ArtObj7500', // 1d4
          'Gem1000', // 3d6
          'Gem5000', // 1d8
        ];
        String lootObj = objects[random.nextInt(objects.length)];
        totalCoins = '${(random.nextInt(61) + 12) * 1000} PO, ${(random.nextInt(41) + 8) * 100} PL';
        switch (lootObj) {
          case 'N':
            totalObjects = totalCoins;
            totalCoins = '';
            break;
          case 'ArtObj2500':
            List<String> artObj2500 = [
              'Corrente de ouro elegante cravejada com uma opala de fogo',
              'Antiga pintura obra-prima',
              'Manto de seda e veludo bordado com diversas pedras da lua cravejadas',
              'Bracelete de platina cravejado com uma safira',
              'Luvas bordadas com lascas de joias',
              'Peúga cheia de joias',
              'Caixa de música de ouro',
              'Argola de ouro cravejada com quatro águas marinhas ',
              'Tapa-olho com um olho falso cravejado em uma safira azul e uma pedra da lua',
              'Um colar de pequenas pérolas rosas',
            ];
            String lootObj = artObj2500[random.nextInt(artObj2500.length)];
            totalObjects =
                '${random.nextInt(10) + 1} x $lootObj de 2.500 PO';
            break;
          case 'ArtObj7500':
            List<String> artObj7500 = [
              'Coroa de ouro cheia de joias',
              'Anel de platina cheio de joias',
              'Pequena estatueta de ouro cravejada com rubis',
              'Taça de ouro cravejada com esmeraldas',
              'Caixa de joias de ouro com filigrana de platina',
              'Sarcófago infantil de ouro pintado',
              'Jogo de tabuleiro de jade com peças de ouro maciço',
              'Chifre de marfim adornado com filigrana de ouro',
            ];
            String lootObj = artObj7500[random.nextInt(artObj7500.length)];
            totalObjects =
                '${random.nextInt(4) + 1} x $lootObj de 7.500 PO';
            break;
          case 'Gem1000':
            List<String> gem1000 = [
              'Opala negra',
              'Safira azul',
              'Esmeralda',
              'Opala de fogo',
              'Opala',
              'Rubi estrela',
              'Safira estrela',
              'Safira amarela',
            ];
            String lootObj = gem1000[random.nextInt(gem1000.length)];
            totalObjects =
                '${random.nextInt(16) + 3} x $lootObj de 1000 PO';
            break;
          case 'Gem5000':
            List<String> gem5000 = [
              'Safira negra',
              'Diamante',
              'Jacinto',
              'Rubi',
            ];
            String lootObj = gem5000[random.nextInt(gem5000.length)];
            totalObjects =
                '${random.nextInt(8) + 1} x $lootObj de 5.000 PO';
            break;
        }
      }
      //PILHA DE TESOURO
      return Column(
        children: [
          ListTile(
            leading: const Icon(FontAwesomeIcons.coins,
                size: 45, color: Colors.amber),
            title: Text(
              totalObjects,
              style: listTileText,
            ),
            subtitle: Text(
              totalCoins,
              style: lootText3,
            ),
            onTap: null,
          ),
          MagicItem(
              rarity:
                  "Raridade ${magicItem[random.nextInt(magicItem.length)]}"),
          MagicItem(
              rarity:
                  "Raridade ${magicItem[random.nextInt(magicItem.length)]}"),
          MagicItem(
              rarity:
                  "Raridade ${magicItem[random.nextInt(magicItem.length)]}"),
        ],
      );
    }
    if (type == 'Individual') {
      //INDIVIDUAL
      String totalCoins =
          'Selecione um Nivel de Tesouro'; //Exibido no Title da ListTile
      String subtitle = 'Individual';

      ///INDIVIDUAL LEVEL 0-4
      if (level == '0-4') {
        subtitle = '';
        //Esses sao os numeros rolados no D100 para determinar as moedas.
        final List<String> d100 = [
          '01-30',
          '31-60',
          '61-70',
          '71-95',
          '96-100'
        ];
        final String rolled = d100[random.nextInt(d100.length)];

        //calcula parcialmente a quantidade de moedas para jogar no total
        int coins = 0;
        //valida a rolagem
        switch (rolled) {
          case '01-30':
            coins = random.nextInt(30 - 4) + 5;
            totalCoins = '$coins PC';
            break;
          case '31-60':
            coins = random.nextInt(24 - 4) + 4;
            totalCoins = '$coins PP';
            break;
          case '61-70':
            coins = random.nextInt(18 - 4) + 3;
            totalCoins = '$coins PE';
            break;
          case '71-95':
            coins = random.nextInt(18 - 4) + 3;
            totalCoins = '$coins PO';
            break;
          case '96-100':
            coins = random.nextInt(6) + 1;
            totalCoins = '$coins PL';
            break;
        }
      }

      ///INDIVIDUAL LEVEL 5-10
      if (level == '5-10') {
        subtitle = '';
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
            totalCoins = '$totalCoins$coins PC, ';

            coins = (random.nextInt(6) + 1) * 10;
            totalCoins = '$totalCoins$coins PE';
            break;
          case '31-60':
            coins = (random.nextInt(31) + 6) * 10;
            totalCoins = '$totalCoins$coins PP, ';

            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = '$totalCoins$coins PO';
            break;
          case '61-70':
            coins = (random.nextInt(16) + 3) * 10;
            totalCoins = '$totalCoins$coins PE, ';

            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = '$totalCoins$coins PO';
            break;
          case '71-95':
            coins = (random.nextInt(21) + 4) * 10;
            totalCoins = '$totalCoins$coins PO';
            break;
          case '96-100':
            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = '$totalCoins$coins PO, ';

            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = '$totalCoins$coins PL';
            break;
        }
      }

      ///INDIVIDUAL LEVEL 11-16
      if (level == '11-16') {
        subtitle = '';
        final List<String> d100 = ['01-20', '21-35', '36-75', '76-100'];
        final String rolled = d100[random.nextInt(d100.length)];
        totalCoins = '';
        int coins = 0;
        switch (rolled) {
          case '01-20':
            coins = (random.nextInt(24 - 3) + 4) * 100;
            totalCoins = '$totalCoins$coins PP, ';

            coins = (random.nextInt(6) + 1) * 100;
            totalCoins = '$totalCoins$coins PO';
            break;
          case '21-35':
            coins = (random.nextInt(6) + 1) * 100;
            totalCoins = '$totalCoins$coins PE, ';

            coins = (random.nextInt(6) + 1) * 100;
            totalCoins = '$totalCoins$coins PO';
            break;
          case '36-75':
            coins = (random.nextInt(11) + 2) * 100;
            totalCoins = '$totalCoins$coins PO, ';

            coins = (random.nextInt(6) + 1) * 10;
            totalCoins = '$totalCoins$coins PL';
            break;
          case '76-100':
            coins = (random.nextInt(11) + 2) * 100;
            totalCoins = '$totalCoins$coins PO, ';

            coins = (random.nextInt(11) + 2) * 10;
            totalCoins = '$totalCoins$coins PL';
            break;
        }
      }

      ///INDIVIDUAL LEVEL 17+
      if (level == '17+') {
        subtitle = '';
        final List<String> d100 = ['1-15', '16-55', '56-100'];
        final String rolled = d100[random.nextInt(d100.length)];
        totalCoins = '';
        int coins = 0;
        switch (rolled) {
          case '1-15':
            coins = (random.nextInt(11) + 2) * 1000;
            totalCoins = '$totalCoins$coins PE, ';

            coins = (random.nextInt(41) + 8) * 100;
            totalCoins = '$totalCoins$coins PO';
            break;
          case '16-55':
            coins = (random.nextInt(6) + 1) * 1000;
            totalCoins = '$totalCoins$coins PO, ';

            coins = (random.nextInt(6) + 1) * 100;
            totalCoins = '$totalCoins$coins PL';
            break;
          case '56-100':
            coins = (random.nextInt(6) + 1) * 1000;
            totalCoins = '$totalCoins$coins PO, ';

            coins = (random.nextInt(11) + 2) * 100;
            totalCoins = '$totalCoins$coins PL';
            break;
        }
      }

      ///TESOURO INDIVIDUAL
      return ListTile(
        leading:
            const Icon(FontAwesomeIcons.coins, size: 45, color: Colors.amber),
        title: Text(
          totalCoins,
          style: lootText2,
        ),
        subtitle: Text(
          subtitle,
          style: lootText3,
        ),
      );
    } else {
      return const ListTile();
    }
  }
}
