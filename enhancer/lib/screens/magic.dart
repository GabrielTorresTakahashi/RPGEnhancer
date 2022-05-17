import 'package:enhancer/models/magic_item.dart';
import 'package:flutter/material.dart';

import '../settings/text_style.dart';

class MagicScreen extends StatelessWidget {
  const MagicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const RaritySelector(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class RaritySelector extends StatefulWidget {
  const RaritySelector({Key? key}) : super(key: key);

  @override
  State<RaritySelector> createState() => _RaritySelectorState();
}

class _RaritySelectorState extends State<RaritySelector> {
  String currentValue = '-Raridade-';
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        margin: const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 40),
        padding: const EdgeInsets.only(left: 20, right: 10),
        height: 70,
        width: double.maxFinite,
        color: Theme.of(context).colorScheme.primary,
        alignment: Alignment.center,
        child: DropdownButton(
          iconSize: 60,
          iconEnabledColor: Theme.of(context).colorScheme.onPrimary,
          isExpanded: true,
          dropdownColor: Theme.of(context).colorScheme.primary,
          underline: Container(),
          style: dropdownText,
          value: currentValue,
          items: <String>[
            '-Raridade-',
            'A',
            'B',
            'C',
            'D',
            'E',
            'F',
            'G',
            'H',
            'I'
          ].map((value) {
            return DropdownMenuItem(
              value: value,
              alignment: Alignment.center,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? valor) {
            setState(() {
              currentValue = valor!;
            });
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 40),
        padding: const EdgeInsets.only(left: 20, right: 10),
        height: 70,
        child: ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text(
              "Gerar",
              style: homeButtonText,
            )),
      ),
      MagicItem(rarity: currentValue),
    ]);
  }
}
