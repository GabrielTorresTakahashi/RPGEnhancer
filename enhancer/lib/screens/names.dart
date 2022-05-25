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
        body: const RaceSelector());
  }
}

class RaceSelector extends StatefulWidget {
  const RaceSelector({Key? key}) : super(key: key);

  @override
  State<RaceSelector> createState() => _RaceSelectorState();
}

class _RaceSelectorState extends State<RaceSelector> {
  String race = '-Raça-';
  String gender = '-Gênero-';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          //Raças
          margin: const EdgeInsets.only(left: 25, right: 25, top: 50),
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
            value: race,
            items: <String>[
              '-Raça-',
              'Anão',
              'Elfo',
              'Halfling',
              'Humano',
              'Draconato',
              'Gnomo',
              'Orc (Meio-Orc)',
            ].map((value) {
              return DropdownMenuItem(
                value: value,
                alignment: Alignment.center,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valor) {
              setState(() {
                race = valor!;
              });
            },
          ),
        ),
        Container(
          //Gênero
          margin: const EdgeInsets.only(left: 25, right: 25, top: 30),
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
            value: gender,
            items: <String>['-Gênero-', 'Masculino', 'Feminino'].map((value2) {
              return DropdownMenuItem(
                value: value2,
                alignment: Alignment.center,
                child: Text(value2),
              );
            }).toList(),
            onChanged: (String? valor) {
              setState(() {
                gender = valor!;
              });
            },
          ),
        ),
        NameGenerator(race: race, gender: gender, placeholder: true,),
        NameGenerator(race: race, gender: gender),
        NameGenerator(race: race, gender: gender),
        NameGenerator(race: race, gender: gender),
        NameGenerator(race: race, gender: gender),
        Align(
            alignment: Alignment.bottomCenter,
            child: RefreshButton(setState: setState)),
      ],
    );
  }
}
