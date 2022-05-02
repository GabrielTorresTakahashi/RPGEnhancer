import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class LootGenerator extends StatelessWidget {
  const LootGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Tesouros'),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [LevelButton(), TreasureType()],
        ),
        const CurrencyCheckbox(),
      ]),
    );
  }
}

class LevelButton extends StatefulWidget {
  const LevelButton({Key? key}) : super(key: key);

  @override
  State<LevelButton> createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  String dropdownValue = '-Nível-';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(10),
        dropdownColor: Theme.of(context).primaryColor,
        style: dropdownText,
        value: dropdownValue,
        items: <String>['-Nível-', '0-4', '5-10', '11-17', '17+']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              width: 180,
              alignment: Alignment.topLeft,
              constraints: const BoxConstraints(minHeight: 48.0),
              child: Text(value),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
      ),
    );
  }
}

class TreasureType extends StatefulWidget {
  const TreasureType({Key? key}) : super(key: key);

  @override
  State<TreasureType> createState() => _TreasureTypeState();
}

class _TreasureTypeState extends State<TreasureType> {
  String dropdownValue = '-Tipo-';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(10),
        dropdownColor: Theme.of(context).primaryColor,
        style: dropdownText,
        value: dropdownValue,
        items: <String>['-Tipo-', 'Individual', 'Pilha']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              width: 180,
              alignment: Alignment.topLeft,
              constraints: const BoxConstraints(minHeight: 48.0),
              child: Text(value),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
      ),
    );
  }
}

class CurrencyCheckbox extends StatefulWidget {
  const CurrencyCheckbox({Key? key}) : super(key: key);

  @override
  State<CurrencyCheckbox> createState() => _CurrencyCheckboxState();
}

class _CurrencyCheckboxState extends State<CurrencyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Theme.of(context).primaryColor;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
