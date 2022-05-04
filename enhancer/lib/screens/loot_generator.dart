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
          children: [
            LootTypeSelector(),
          ],
        ));
  }
}

class GeneratedLoot extends StatelessWidget {
  const GeneratedLoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Junção do LevelAmount e do TypeCheckbox, montando o layout de seleção de tipo
// ignore: must_be_immutable
class LootTypeSelector extends StatelessWidget {
  bool currency = false;
  bool scrolls = false;
  bool magicItems = false;
  bool normalItems = false;
  String level = '';
  String ammount = '';

  LootTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownSelector(
              options: const ['-Nível-', '1-4', '5-10', '11-17', '17+'],
              controls: level,
            ),
            DropdownSelector(
              options: const ['-Quantia-', 'Individual', 'Pilha'],
              controls: ammount,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCheckbox(
                  text: 'Currency',
                  controls: currency,
                ),
                TextCheckbox(
                  text: 'Scrolls',
                  controls: scrolls,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCheckbox(
                  text: 'Magic Items',
                  controls: magicItems,
                ),
                TextCheckbox(
                  text: 'Normal Items',
                  controls: normalItems,
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

//Dropdown que recebe um vetor de string com as opções.
//Usado para selecionar o nível e quantia do tesouro
// ignore: must_be_immutable
class DropdownSelector extends StatefulWidget {
  final List<String> options;
  String controls;

  DropdownSelector({Key? key, required this.options, required this.controls})
      : super(key: key);

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
              widget.controls = currentValue;
              debugPrint('Selected ' + widget.controls);
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
  bool controls;
  TextCheckbox({Key? key, required this.text, required this.controls})
      : super(key: key);

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
              widget.controls = isChecked;
              debugPrint(widget.text + ' ' + widget.controls.toString());
            });
          },
        ),
        Text(widget.text, style: checkboxText)
      ],
    );
  }
}
