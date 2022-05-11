import 'dart:math';

import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class LootScreen extends StatelessWidget {
  const LootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(),
        body: TreasureLevel());
  }
}

class TreasureLevel extends StatefulWidget {
  const TreasureLevel({Key? key}) : super(key: key);

  @override
  State<TreasureLevel> createState() => _TreasureLevelState();
}

class _TreasureLevelState extends State<TreasureLevel> {
  String currentValue = '1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: null,
      hint: Text("HINT"),
      value: currentValue,
      dropdownColor: Theme.of(context).primaryColor,
      ///////////////////////////////////////
      items: <String>['1', 'B'].map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      ////////////////////////////
      onChanged: (String? value) {
        setState(() {
          currentValue = value!;
        });
      },
    );
  }
}

class Currency extends StatefulWidget {
  final String type;
  const Currency({Key? key, required this.type}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  //Retorna um ListTile. Bom pra colocar em ListView
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    List<String> gem10Name = [
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
    List<String> artObject25Name = [
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
    List<String> gem50Name = [
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
    late String name;
    if (widget.type == 'Pile') {
      List<int> rarity = [10, 25, 50];
      int dice = 6;
      int selectedRarity = rarity[random.nextInt(rarity.length)];
      debugPrint(selectedRarity.toString());
      if (selectedRarity == 25) {
        dice = 4;
        name = artObject25Name[random.nextInt(10)];
      } else if (selectedRarity == 10) {
        name = gem10Name[random.nextInt(12)];
      } else {
        name = gem50Name[random.nextInt(12)];
      }
      debugPrint(name);
      int ammount = (random.nextInt(dice) + 1);

      return ListTile(
        leading: const FlutterLogo(),
        title: Text(
          "$ammount x $name",
          style: lootText,
        ),
        subtitle: Text(
          "$selectedRarity PO cada",
          style: lootText,
        ),
        onTap: () => setState(() {}),
      );
    } else {
      List<String> rarity = ["PL", "PO", "PP", "PC", "PE"];
      int diceMultiplier = random.nextInt(rarity.length) + 2;
      String selectedRarity = rarity[diceMultiplier - 2];
      if (selectedRarity == 'PL') {
        //se for PL, somente 1 dado
        diceMultiplier = 1;
      }
      if (selectedRarity == 'PE') {
        //se for PE, são 3 dados
        diceMultiplier = 3;
      }
      String ammount = ((5 + 1) * diceMultiplier).toString();

      return ListTile(
        leading: const FlutterLogo(),
        title: Text(
          '$ammount $selectedRarity',
          style: lootText,
        ),
        onTap: () => setState(() {}),
      );
    }
  }
}
