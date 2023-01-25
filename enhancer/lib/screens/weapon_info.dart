import 'package:enhancer/database/model/weapon_model.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class WeaponInfoScreen extends StatelessWidget {
  final Weapon weapon;
  const WeaponInfoScreen({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(weapon.name, style: appBarText),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weapon.name, style: weaponTitleText),
            Text("Arma ${weapon.type} ${weapon.range}",
                style: weaponInfoPropertiesText),
            const SizedBox(height: 20),
            Text("Dano: ${weapon.damage}", style: weaponInfoDamageText),
            Text("Preço: ${weapon.price}", style: weaponInfoPriceText),
            Text("Peso: ${weapon.weight}", style: weaponInfoWeightText),
            const SizedBox(height: 40),
            Text("Propriedades: ${weapon.properties}",
                style: weaponInfoPropertiesText),
          ],
        ),
      ),
    );
  }
}
