import 'package:enhancer/database/services/database_helper.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../database/model/weapon_model.dart';

class WeaponsScreen extends StatelessWidget {
  final Weapon? weapon;
  const WeaponsScreen({Key? key, this.weapon}) : super(key: key);

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
              List<DataRow> rows = [];
              for (int index = 0; index < snapshot.data!.length; ++index) {
                rows.add(
                  DataRow(cells: <DataCell>[
                    DataCell(Text(
                      snapshot.data![index].name,
                      style: weaponInfo,
                    )),
                    DataCell(Text(
                      snapshot.data![index].damage,
                      style: weaponInfo,
                    )),
                    DataCell(Text(
                      snapshot.data![index].properties,
                      style: weaponInfo,
                    )),
                    DataCell(Text(
                      snapshot.data![index].price,
                      style: weaponPrice,
                    )),
                    DataCell(Text(
                      "${snapshot.data![index].type} ${snapshot.data![index].range}",
                      style: weaponInfo,
                    )),
                    DataCell(Text(
                      snapshot.data![index].weight,
                      style: weaponInfo,
                    )),
                  ]),
                );
              }

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(columns: [
                      DataColumn(
                          label: Text(
                        'Nome',
                        style: weaponHeader,
                      )),
                      DataColumn(
                        label: Text(
                          'Dano',
                          style: weaponHeader,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Propriedades',
                          style: weaponHeader,
                        ),
                      ),
                      DataColumn(
                          label: Text(
                        'Preço',
                        style: weaponHeader,
                      )),
                      DataColumn(
                          label: Text(
                        'Tipo',
                        style: weaponHeader,
                      )),
                      DataColumn(
                          label: Text(
                        'Peso',
                        style: weaponHeader,
                      )),
                    ], rows: rows)),
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
