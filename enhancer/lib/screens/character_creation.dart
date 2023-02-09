import 'dart:developer';

import 'package:enhancer/database/model/alignment_model.dart';
import 'package:enhancer/database/model/background_model.dart';
import 'package:enhancer/database/model/race_model.dart';
import 'package:enhancer/database/services/database_helper.dart';
import 'package:enhancer/settings/color_settings.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CharacterCreationScreen extends StatefulWidget {
  const CharacterCreationScreen({Key? key}) : super(key: key);

  @override
  State<CharacterCreationScreen> createState() =>
      _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    int strMod = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: FormBuilder(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FormBuilderTextField(
                name: 'name',
                style: characterCreationInputText,
                decoration: textInputDecoration.copyWith(
                  labelText: 'Nome',
                ),
              ),
              FutureBuilder<List<Background>?>(
                  future: DatabaseHelper.getAllBackgrounds(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return FormBuilderDropdown(
                          initialValue: null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.primary,
                            labelText: '-Antecedente-',
                            labelStyle: dropdownText,
                            suffixIconColor:
                                Theme.of(context).colorScheme.onPrimary,
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                          ),
                          icon: const SizedBox(),
                          dropdownColor: Theme.of(context).colorScheme.primary,
                          style: dropdownText,
                          name: 'backgroundId',
                          items: snapshot.data!
                              .map(
                                (background) => DropdownMenuItem(
                                  value: background.id.toString(),
                                  child: Text(background.name),
                                ),
                              )
                              .toList());
                    }
                    return Container(
                        width: 100,
                        height: 50,
                        color: Theme.of(context).colorScheme.primary);
                  }),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                  width: 180,
                  child: FormBuilderTextField(
                    name: 'xp',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: characterCreationInputText,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Experiência',
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: FormBuilderTextField(
                    name: 'level',
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: characterCreationInputText,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Nível',
                    ),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: FutureBuilder<List<Race>?>(
                      future: DatabaseHelper.getAllRaces(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return FormBuilderDropdown(
                              name: 'raceId',
                              iconEnabledColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              dropdownColor:
                                  Theme.of(context).colorScheme.primary,
                              decoration: dropdownSmallDecoration.copyWith(
                                  hintText: '-Raça-'),
                              style: dropdownSmallText,
                              items: snapshot.data!
                                  .map(
                                    (race) => DropdownMenuItem(
                                      value: race.id.toString(),
                                      child: Text(race.name),
                                    ),
                                  )
                                  .toList());
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: FutureBuilder<List<CharacterAlignment>?>(
                      future: DatabaseHelper.getAllAlignments(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return FormBuilderDropdown(
                              name: 'alignmentId',
                              iconEnabledColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              decoration: dropdownSmallDecoration.copyWith(
                                  hintText: '-Tendência-'),
                              dropdownColor:
                                  Theme.of(context).colorScheme.primary,
                              style: dropdownText,
                              items: snapshot.data!
                                  .map((alignment) => DropdownMenuItem(
                                      value: alignment.id.toString(),
                                      child: Text(alignment.alias)))
                                  .toList());
                        }
                        return const SizedBox();
                      }),
                    ),
                  ),
                ],
              ),
              //Subrace
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'strength',
                          initialValue: '10',
                          onChanged: (value) {
                            _formKey.currentState!.fields['strength']!.save();
                            strMod = int.parse(_formKey
                                .currentState!.fields['strength']!.value);
                            strMod = ((strMod - 10) / 2).floor();
                            setState(() {});
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: characterCreationInputText,
                          decoration: textInputDecoration.copyWith(
                            labelText: 'Força',
                          ),
                        ),
                        Text(strMod.toString()),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: FormBuilderTextField(
                      name: 'dexterity',
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: characterCreationInputText,
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Destreza',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: FormBuilderTextField(
                      name: 'constitution',
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: characterCreationInputText,
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Constituição',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    child: FormBuilderTextField(
                      name: 'intelligence',
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: characterCreationInputText,
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Inteligência',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: FormBuilderTextField(
                      name: 'wisdom',
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: characterCreationInputText,
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Sabedoria',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: FormBuilderTextField(
                      name: 'charisma',
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: characterCreationInputText,
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Carisma',
                      ),
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  log(_formKey.currentState!.value.toString());
                },
                child: const Text('SUBMIT'),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
