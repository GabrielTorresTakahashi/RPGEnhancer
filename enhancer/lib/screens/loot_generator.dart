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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [LevelButton(), TreasureType()],
          ),
          const LootCategories(),
          const GenerateLoot(),
        ],
      ),
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

class LootCheckbox extends StatefulWidget {
  const LootCheckbox(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  State<LootCheckbox> createState() => _LootCheckboxState();
}

class _LootCheckboxState extends State<LootCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Theme.of(context).primaryColor;
    }

    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: (bool? value) {
              setState(
                () {
                  isChecked = value!;
                },
              );
            },
          ),
          Text(
            widget.text,
            style: checkboxText,
          ),
        ],
      ),
    );
  }
}

class LootCategories extends StatelessWidget {
  const LootCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          LootCheckbox("corency"),
          LootCheckbox("scrols"),
        ]),
        TableRow(
          children: [
            LootCheckbox("nomral itnes"),
            LootCheckbox("macig mites"),
          ],
        ),
      ],
    );
  }
}

//GENERATE LOOT+STATE = BOTÃO + CONTAINER DE LOOT
class GenerateLoot extends StatefulWidget {
  const GenerateLoot({Key? key}) : super(key: key);

  @override
  State<GenerateLoot> createState() => _GenerateLootState();
}

class _GenerateLootState extends State<GenerateLoot> {
  late String currency;
  late String magicItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(currency)],
    );
  }
}
