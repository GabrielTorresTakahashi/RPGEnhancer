import 'package:enhancer/database/model/equipment_model.dart';
import 'package:enhancer/database/services/database_helper.dart';
import 'package:enhancer/screens/equipment_info.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EquipmentsScreen extends StatelessWidget {
  const EquipmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DatabaseHelper.purgeDatabase();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Equipamento", style: appBarText),
      ),
      body: FutureBuilder<List<Equipment>?>(
        future: DatabaseHelper.getAllEquipments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              List<Widget> weaponList = [];
              for (int index = 0; index < snapshot.data!.length; index++) {
                weaponList.add(
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.sackDollar,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                    title: Text(
                      snapshot.data![index].name,
                      style: weaponNameText,
                    ),
                    subtitle: Text(
                      snapshot.data![index].category == null
                          ? ""
                          : "${snapshot.data![index].category}",
                      style: weaponTypeRangeText,
                    ),
                    trailing: Text(snapshot.data![index].price,
                        style: weaponInfoPriceText),
                    onTap: () async => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EquipmentInfoScreen(
                                equipment: snapshot.data![index]))),
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
