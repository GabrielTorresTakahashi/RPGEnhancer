import 'package:enhancer/database/model/armor_model.dart';
import 'package:enhancer/database/services/database_helper.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArmorScreen extends StatelessWidget {
  const ArmorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DatabaseHelper.purgeDatabase();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Armaduras", style: appBarText),
      ),
      body: FutureBuilder<List<Armor>?>(
        future: DatabaseHelper.getAllArmor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              List<Widget> weaponList = [];
              for (int index = 0; index < snapshot.data!.length; index++) {
                weaponList.add(
                  ListTile(
                    isThreeLine: true,
                    leading: Icon(
                        snapshot.data![index].stealth != null
                            ? FontAwesomeIcons.volumeHigh
                            : FontAwesomeIcons.volumeXmark,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30),
                    title:
                        Text(snapshot.data![index].name, style: weaponNameText),
                    subtitle: Text(
                        "${snapshot.data![index].category}. ${snapshot.data![index].strength ?? ""}\n CA: ${snapshot.data![index].armorClass}",
                        style: weaponTypeRangeText),
                    trailing: Text("${snapshot.data![index].price}\n${snapshot.data![index].weight}",
                        style: weaponInfoPriceText),
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
