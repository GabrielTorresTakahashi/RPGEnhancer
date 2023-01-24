import 'dart:developer';

import 'package:enhancer/database/services/database_helper.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

import '../database/model/weapon_model.dart';

class WeaponsScreen extends StatelessWidget {
  final Weapon? weapon;
  const WeaponsScreen({Key? key, this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Weapon>?> armas = DatabaseHelper.getAllWeapons();
    armas.then((value) => log(value.toString()));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(titleTextStyle: appBarText, title: const Text("Armas")),
      body: FutureBuilder<List<Weapon>?>(
        future: DatabaseHelper.getAllWeapons(),
        builder: (context, AsyncSnapshot<List<Weapon>?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data![index].name, style: listTileText),
                  leading: Text(
                    snapshot.data![index].properties,
                    style: listTileText,
                  ),
                ),
              );
            }
          }
          return const Text("Sem registros");
        },
      ),
    );
  }
}
