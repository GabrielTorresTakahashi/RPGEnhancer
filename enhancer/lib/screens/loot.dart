import 'package:enhancer/models/currency.dart';
import 'package:enhancer/models/refresh_button.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class LootScreen extends StatelessWidget {
  const LootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Tesouros",
          style: appBarText,
        ),
      ),
      body: const TreasureLevel(),
    );
  }
}

class TreasureLevel extends StatefulWidget {
  const TreasureLevel({Key? key}) : super(key: key);

  @override
  State<TreasureLevel> createState() => _TreasureLevelState();
}

class _TreasureLevelState extends State<TreasureLevel> {
  String? currentValue = '-Nível-';
  String? currentValue2 = '-Tipo-';
  String lootType = '-Tipo-';
  String nivel = '-Nível-';
  bool currency = false;

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 20),
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
            items:
                <String>['-Nível-', '0-4', '5-10', '11-16', '17+'].map((value) {
              return DropdownMenuItem(
                value: value,
                alignment: Alignment.center,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valor) {
              setState(() {
                currentValue = valor!;
                nivel = valor;
              });
            },
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 25, right: 25),
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
            value: currentValue2,
            items:
                <String>['-Tipo-', 'Individual', 'Pilha'].map((value) {
              return DropdownMenuItem(
                value: value,
                alignment: Alignment.center,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valor) {
              setState(() {
                currentValue2 = valor!;
                lootType = valor;
              });
            },
          ),
        ),
        Currency(type: lootType, level: nivel),
        const Expanded(child: SizedBox()),
        RefreshButton(setState: setState),
      ],
    );
  }
}

class TextCheckbox extends StatefulWidget {
  final String text;
  final bool attribute;
  const TextCheckbox({Key? key, required this.text, required this.attribute})
      : super(key: key);

  @override
  State<TextCheckbox> createState() => _TextCheckboxState();
}

class _TextCheckboxState extends State<TextCheckbox> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.text,
          style: checkboxText,
        ),
      ],
    );
  }
}
