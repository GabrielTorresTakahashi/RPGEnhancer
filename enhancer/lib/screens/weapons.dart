import 'package:enhancer/database/services/database_helper.dart';
import 'package:enhancer/screens/weapon_info.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../database/model/weapon_model.dart';

class WeaponsScreen extends StatelessWidget {
  const WeaponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(titleTextStyle: appBarText, title: const Text("Armas")),
      body: FutureBuilder<List<Weapon>?>(
        future: DatabaseHelper.getAllWeapons(),
        builder: (context, AsyncSnapshot<List<Weapon>?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              List<Widget> weaponList = [];
              for (int index = 0; index < snapshot.data!.length; index++) {
                weaponList.add(
                  ListTile(
                    isThreeLine: true,
                    leading: Icon(
                      snapshot.data![index].type == "Simples"
                          ? FontAwesomeIcons.person
                          : FontAwesomeIcons.personBurst,
                      color: snapshot.data![index].type == "Simples"
                          ? Colors.white
                          : Colors.amber,
                      size: 30,
                    ),
                    title: Text(
                      snapshot.data![index].name,
                      style: weaponNameText,
                    ),
                    subtitle: Text(
                      "${snapshot.data![index].type} ${snapshot.data![index].range}",
                      style: weaponTypeRangeText,
                    ),
                    trailing: Icon(
                      snapshot.data![index].range == "Corpo-a-corpo"
                          ? FontAwesomeIcons.shield
                          : FontAwesomeIcons.bullseye,
                      color: Colors.white,
                      size: 35,
                    ),
                    onTap: () async => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeaponInfoScreen(
                                weapon: snapshot.data![index]))),
                  ),
                );
              }

              return ListView(
                children: weaponList,
              );
            }
          }
          return Text(
            "Sem registros",
            style: itemText,
          );
        },
      ),
    );
  }
}
