import 'package:enhancer/database/model/equipment_model.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class EquipmentInfoScreen extends StatelessWidget {
  final Equipment equipment;
  const EquipmentInfoScreen({Key? key, required this.equipment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(equipment.name, style: appBarText),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(equipment.name, style: weaponTitleText),
            Text(equipment.category == null ? "" : equipment.category!,
                style: weaponInfoPropertiesText),
            const SizedBox(height: 20),
            Text("Preço: ${equipment.price}", style: weaponInfoPriceText),
            Text("Peso: ${equipment.weight}", style: weaponInfoWeightText),
            const SizedBox(height: 40),
            Text(equipment.description == null ? '' : equipment.description!,
                style: weaponInfoPropertiesText),
          ],
        ),
      ),
    );
  }
}
