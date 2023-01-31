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
        child: Column(
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
                  snapshot.data!;
                }
                return const Text('No Races Found');
              },
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
