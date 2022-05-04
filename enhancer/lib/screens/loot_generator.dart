import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class LootGenerator extends StatelessWidget {
  const LootGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            LootTypeSelector(),
          ],
        ));
  }
}

//Junção do LevelAmount e do TypeCheckbox, montando o layout de seleção de tipo
// ignore: must_be_immutable
class LootTypeSelector extends StatelessWidget {
  const LootTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          //duas checkboxes
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            DropdownSelector(
              options: ['-Nível-', '1-4', '5-10', '11-17', '17+'],
            ),
            DropdownSelector(
              options: ['-Quantia-', 'Individual', 'Pilha'],
            )
          ],
        ),
        Row(
          //duas checkboxes
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextCheckbox(
                  text: 'Currency',
                ),
                TextCheckbox(
                  text: 'Scrolls',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextCheckbox(
                  text: 'Itemes',
                ),
                TextCheckbox(
                  text: 'Items',
                ),
              ],
            ),
          ],
        ),
        GeneratedLoot(),
      ],
    );
  }
}

//Quadrado dos loot gerados
// ignore: must_be_immutable
class GeneratedLoot extends StatefulWidget {
  List<bool>? parameters = [];

  // late bool currency = parameters![0];
  // late bool currency = parameters![0];

  GeneratedLoot({Key? key, this.parameters}) : super(key: key);

  @override
  State<GeneratedLoot> createState() => _GeneratedLootState();
}

class _GeneratedLootState extends State<GeneratedLoot> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(leading: null, title: null),
        ListTile(leading: null, title: null),
        ListTile(leading: null, title: null),
        ListTile(leading: null, title: null),
      ],
    );
  }
}

//Dropdown que recebe um vetor de string com as opções.
//Usado para selecionar o nível e quantia do tesouro
class DropdownSelector extends StatefulWidget {
  final List<String> options;

  const DropdownSelector({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  State<DropdownSelector> createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  late String currentValue = widget.options[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      color: Theme.of(context).primaryColor,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          alignment: AlignmentDirectional.center,
          dropdownColor: Theme.of(context).primaryColor,
          value: currentValue,
          onChanged: (String? newValue) {
            setState(() {
              currentValue = newValue!;
              debugPrint('Selected ' + currentValue);
            });
          },
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              alignment: AlignmentDirectional.center,
              value: value,
              child: Text(
                value,
                style: dropdownText,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

//Checkbox com texto ao lado, recebe por parâmetro a string do texto
//Usado para selecionar o tipo de tesouro
// ignore: must_be_immutable
class TextCheckbox extends StatefulWidget {
  final String text;
  const TextCheckbox({Key? key, required this.text}) : super(key: key);

  @override
  State<TextCheckbox> createState() => _TextCheckboxState();
}

class _TextCheckboxState extends State<TextCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set states) {
      return Theme.of(context).primaryColor;
    }

    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
              debugPrint(value.toString());
            });
          },
        ),
        Text(widget.text, style: checkboxText)
      ],
    );
  }
}
