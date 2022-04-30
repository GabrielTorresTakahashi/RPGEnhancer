
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class LootGenerator extends StatelessWidget {
  const LootGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: const Center(
        child: LevelButton(),
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
  String dropdownValue = '0-4';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: DropdownButton(
        style: buttonText,

        value: dropdownValue,
        items: <String>['0-4', '5-10','11-17', '17+']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(minHeight: 48.0),
              padding: EdgeInsets.zero,
              color: Theme.of(context).primaryColor,
              child: Text(value),),
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
