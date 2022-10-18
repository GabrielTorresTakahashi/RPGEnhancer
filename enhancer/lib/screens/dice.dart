import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:math';

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int ammount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados"),
      ),
      body: Column(
        children: [
          Dice(sides: 4, title: "D4", ammount: ammount),
          Dice(sides: 6, title: "D6", ammount: ammount),
          Dice(sides: 8, title: "D8", ammount: ammount),
          Dice(sides: 10, title: "D10", ammount: ammount),
          Dice(sides: 12, title: "D12", ammount: ammount),
          Dice(sides: 20, title: "D20", ammount: ammount),
          Dice(sides: 100, title: "D100", ammount: ammount),
          const Expanded(child: SizedBox()),
          Text(
            "${ammount}d",
            style: listTileText.copyWith(fontSize: 32),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                      bottom: 50, top: 10, left: 10, right: 10),
                  child: ElevatedButton(
                      child: const Icon(
                        Icons.remove,
                        size: 25,
                      ),
                      onLongPress: () {
                        setState(() {
                          ammount = 1;
                        });
                      },
                      onPressed: () {
                        setState(() {
                          if (ammount > 1) {
                            ammount--;
                          }
                        });
                      })),
              Container(
                height: 50,
                margin: const EdgeInsets.only(
                    bottom: 50, top: 10, left: 10, right: 10),
                child: ElevatedButton(
                  child: const Icon(Icons.add, size: 25),
                  onPressed: () {
                    setState(() {
                      ammount++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      ammount += 10;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final int sides;
  final int ammount;
  final String title;
  const Dice(
      {Key? key, required this.sides, required this.title, this.ammount = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          const Icon(FontAwesomeIcons.diceD20, color: Colors.white, size: 40),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) {
              return DiceRoll(dice: sides, diceAmmount: ammount);
            });
      },
    );
  }
}

class DiceRoll extends StatelessWidget {
  final int dice;
  final int diceAmmount;
  const DiceRoll({Key? key, this.dice = 20, this.diceAmmount = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    String rolledDie = 'Rolls:';
    int total = 0;
    for (int i = 0; i < diceAmmount; i++) {
      int roll = (random.nextInt(dice) + 1);
      total += roll;
      rolledDie = '$rolledDie $roll';
    }
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      backgroundColor: Theme.of(context).colorScheme.primary,
      alignment: Alignment.center,
      //Soma dos valores
      title: Center(
        heightFactor: 1,
        child: Text(
          total.toString(),
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      //Valores individuais
      content: Center(
        heightFactor: 1,
        child: Text(rolledDie, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
