import 'package:enhancer/database/model/character_model.dart';
import 'package:enhancer/database/services/database_helper.dart';
import 'package:enhancer/screens/character_creation.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CharacterCreationScreen()))),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Character>?>(
              future: DatabaseHelper.getAllCharacters(),
              builder: (context, AsyncSnapshot<List<Character>?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    List<ListTile> characters = [];
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      characters.add(
                        ListTile(
                          title: Text(snapshot.data![i].name),
                          subtitle: Text("${snapshot.data![i].raceId}"),
                        ),
                      );
                    }
                  }
                }
                return Text("Sem personagens ainda.", style: titleText);
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
