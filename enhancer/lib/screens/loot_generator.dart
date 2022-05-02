import 'package:enhancer/screens/home.dart';
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
            children: [DropdownTypeButton(const ['-Nível-','0-4','5-10']), DropdownTypeButton(const ['-Quantia-','Individual','Pilha'])],
          ),
          const LootCategories(),
          HomeButton(HomeScreen(), 'Generate')
        ],
      ),
    );
  }
}

class DropdownTypeButton extends StatefulWidget {
  DropdownTypeButton(this.items,{Key? key}) : super(key: key);

    late List<String> items;


  @override
  State<DropdownTypeButton> createState() => _DropdownTypeButtonState();
}

class _DropdownTypeButtonState extends State<DropdownTypeButton> {
  late String dropdownValue = widget.items[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Theme.of(context).primaryColor,
          style: dropdownText,
          value: dropdownValue,
          items: widget.items
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                alignment: Alignment.centerLeft,
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
          LootCheckbox("Dinheiro"),
          LootCheckbox("Pergaminhos"),
        ]),
        TableRow(
          children: [
            LootCheckbox("Itens Normais"),
            LootCheckbox("Itens Mágicos"),
          ],
        ),
      ],
    );
  }
}

//GENERATE LOOT+STATE = BOTÃO + CONTAINER DE LOOT
// class GenerateLoot extends StatefulWidget {
//   const GenerateLoot({Key? key}) : super(key: key);

//   @override
//   State<GenerateLoot> createState() => _GenerateLootState();
// }

// class _GenerateLootState extends State<GenerateLoot> {
//   late String currency;
//   late String magicItem;

//   @override
//   Widget build(BuildContext context) {
//     return Elev
//   }
// }
