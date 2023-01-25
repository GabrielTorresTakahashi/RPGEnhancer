import 'package:enhancer/database/model/equipment_model.dart';
import 'package:enhancer/database/services/database_helper.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

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
              return Text(
                "${snapshot.data![0].name} ${snapshot.data![0].price} ${snapshot.data![0].weight}",
                style: itemText,
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
