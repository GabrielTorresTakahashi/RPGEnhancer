import 'package:enhancer/models/name_generator.dart';
import 'package:enhancer/models/refresh_button.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(title: const Text("Nomes")),
        body: Column(
          children: [
            RaceSelector(),
          ],
        ));
  }
}

class RaceSelector extends StatefulWidget {
  const RaceSelector({Key? key}) : super(key: key);

  @override
  State<RaceSelector> createState() => _RaceSelectorState();
}

class _RaceSelectorState extends State<RaceSelector> {
  String raceValue = '-Raça-';
  String genderValue = '-Gênero-';
  late String race;
  late String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 40),
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
            value: raceValue,
            items:
                <String>['-Raça-','Anão','Humano','Halfling'].map((value) {
              return DropdownMenuItem(
                value: value,
                alignment: Alignment.center,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valor) {
              setState(() {
                raceValue = valor!;
                race = valor;
              });
            },
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 40),
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
            value: raceValue,
            items:
                <String>['-Gênero-','Masculino','Feminino'].map((value) {
              return DropdownMenuItem(
                value: value,
                alignment: Alignment.center,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valor) {
              setState(() {
                genderValue = valor!;
                gender = valor;
              });
            },
          ),
        ),
        ListTile(title: NameGenerator(race: race, gender: gender)),
        RefreshButton(setState: setState),
      ],
    );
  }
}
