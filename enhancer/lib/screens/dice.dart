
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text("DICEROLLER.TXT"),),
      body: Column(
        children: [
          Dice()
        ],
      ),
    );
  }
}

class Dice extends StatelessWidget {
  const Dice({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(FontAwesomeIcons.diceD20, color: Colors.white, size: 40,),
      title: Text("D20", style: lootText,),
      onTap: (){const AlertDialog(title: const Text("TEXTO"));},
    );
  }
}