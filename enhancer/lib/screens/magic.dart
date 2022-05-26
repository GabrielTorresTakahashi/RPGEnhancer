import 'package:enhancer/models/magic_item.dart';
import 'package:enhancer/models/refresh_button.dart';
import 'package:flutter/material.dart';

import '../settings/text_style.dart';

class MagicScreen extends StatelessWidget {
  const MagicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Itens Mágicos", style: appBarText,),
      ),
      body: const MagicItemGenerator(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class MagicItemGenerator extends StatefulWidget {
  const MagicItemGenerator({Key? key}) : super(key: key);

  @override
  State<MagicItemGenerator> createState() => _MagicItemGeneratorState();
}

class _MagicItemGeneratorState extends State<MagicItemGenerator> {
  String currentValue = '-Raridade-';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 25, right: 25, top: 50, bottom: 40),
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
                  'Raridade A',
                  'Raridade B',
                  'Raridade C',
                  'Raridade D',
                  'Raridade E',
                  'Raridade F',
                  'Raridade G',
                  'Raridade H',
                  'Raridade I'
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
            MagicItem(rarity: currentValue, placeholder: true,),
            MagicItem(rarity: currentValue),
            MagicItem(rarity: currentValue),
            MagicItem(rarity: currentValue),
            MagicItem(rarity: currentValue),
          ],
        ),
        RefreshButton(setState: setState)
      ],
    );
  }
}
