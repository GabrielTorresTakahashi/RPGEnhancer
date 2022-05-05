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
      body: const CurrencyPile(level: 0),
    );
  }
}

class CurrencyIndividual extends StatefulWidget {
  final int level;
  const CurrencyIndividual({Key? key, required this.level}) : super(key: key);

  @override
  State<CurrencyIndividual> createState() => _CurrencyIndividualState();
}

class _CurrencyIndividualState extends State<CurrencyIndividual> {
  String loot = '';
  Random random = Random();
  List rarity = ["PL", "PO", "PP", "PC"];
  String ammount = '';

  @override
  Widget build(BuildContext context) {
    int rarityMultiplier = random.nextInt(rarity.length);
    String selectedRarity = rarity[rarityMultiplier];
    if (rarityMultiplier == 0) {
      rarityMultiplier--;
    }
    return ListTile(
      leading: const FlutterLogo(),
      title: Text(
        loot,
        style: lootText,
      ),
      onTap: () => setState(() {
        ammount = ((random.nextInt(5) + 1) * (rarityMultiplier + 2)).toString();
        loot = '$ammount $selectedRarity';
      }),
    );
  }
}

class CurrencyPile extends StatefulWidget {
  final int level;
  const CurrencyPile({Key? key, required this.level}) : super(key: key);

  @override
  State<CurrencyPile> createState() => _CurrencyPileState();
}

class _CurrencyPileState extends State<CurrencyPile> {
  Random random = Random();
  String loot = '';
  int ammount = 0;
  List<String> gem10Name= ['Azurita', 'Agata Malhada', 'Quartzo azul', 'Ágata ocular', 'Hematita', 'Lápis lazúli', 'Malaquita', 'Ágata musgo', 'Obsidiana', 'Rodocrosita', 'Olho de tigre', 'Turquesa'];
  List<String> object25Name= [];
  List<String> gem50Name= [];
  List<int> rarity = [10,25,50];

  @override
  Widget build(BuildContext context) {
  String lootObject = 'Gemas ';
  int dice = 6;
  int selectedRarity = rarity[random.nextInt(rarity.length)];
  if(selectedRarity == 25){
    dice = 4;
    lootObject = 'Objetos de Arte ';
  }

    return ListTile(
      leading: const FlutterLogo(),
      title: Text(
        loot,
        style: lootText,
      ),
      onTap: () => setState(() {
        ammount = (random.nextInt(dice+1));
        loot = "$ammount $lootObject de $selectedRarity PO";
        
        
      }),
    );
  }
}
