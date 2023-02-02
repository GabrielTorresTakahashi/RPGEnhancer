import 'dart:developer';

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FormBuilderTextField(
                  style: listTileText,
                  decoration: textInputDecoration.copyWith(hintText: 'Nome'),
                  name: 'name'),
              FutureBuilder<List<Race>?>(
                future: DatabaseHelper.getAllRaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return FormBuilderDropdown(
                        initialValue: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.primary,
                          labelText: '-Raça-',
                          labelStyle: dropdownText,
                          suffixIconColor:
                              Theme.of(context).colorScheme.onPrimary,
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                        ),
                        icon: const SizedBox(),
                        dropdownColor: Colors.blue,
                        style: dropdownText,
                        name: 'raceId',
                        items: snapshot.data!
                            .map(
                              (race) => DropdownMenuItem(
                                value: race.id.toString(),
                                child: Text(race.name),
                              ),
                            )
                            .toList());
                  }
                  return const Text('No Races Found');
                },
              ),
              FormBuilderTextField(name: 'level'),
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
