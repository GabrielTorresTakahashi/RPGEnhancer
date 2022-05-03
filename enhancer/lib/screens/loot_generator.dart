import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class LootGenerator extends StatelessWidget {
  const LootGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const LootTypeSelector(),
    );
  }
}

class LevelAmountSelector extends StatefulWidget {
  final List<String> options;

  const LevelAmountSelector(this.options, {Key? key}) : super(key: key);

  @override
  State<LevelAmountSelector> createState() => _LevelAmountSelectorState();
}

class _LevelAmountSelectorState extends State<LevelAmountSelector> {
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

class TypeCheckbox extends StatefulWidget {
  final String text;
  const TypeCheckbox(this.text, {Key? key}) : super(key: key);

  @override
  State<TypeCheckbox> createState() => _TypeCheckboxState();
}

class _TypeCheckboxState extends State<TypeCheckbox> {
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
            });
          },
        ),
        Text(widget.text, style: checkboxText)
      ],
    );
  }
}

class LootTypeSelector extends StatelessWidget {
  const LootTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            LevelAmountSelector(['-Nível-']),
            LevelAmountSelector(['-Quantia-'])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TypeCheckbox('Dinheiro'),
                TypeCheckbox('Pergaminhos'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TypeCheckbox('Itens Normais'),
                TypeCheckbox('Itens Mágicos'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
