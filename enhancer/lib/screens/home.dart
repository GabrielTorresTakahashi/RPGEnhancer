import 'package:enhancer/screens/armor.dart';
import 'package:enhancer/screens/dice.dart';
import 'package:enhancer/screens/home2.dart';
import 'package:enhancer/screens/names.dart';
import 'package:enhancer/screens/weapons.dart';
import 'package:enhancer/settings/color_settings.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'equipments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background, //scaffold color

      appBar: AppBar(
        title: Text(
          "Home",
          style: appBarText,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AppTitle(),
            MenuNavigationButton(
                icon: FontAwesomeIcons.person,
                path: NameScreen(),
                buttonTitle: "Nomes"),
            MenuNavigationButton(
                icon: FontAwesomeIcons.diceD20,
                path: DiceScreen(),
                buttonTitle: "Dados"),
            MenuNavigationButton(
                icon: FontAwesomeIcons.hammer,
                path: WeaponsScreen(),
                buttonTitle: 'Armas'),
            MenuNavigationButton(
                icon: Icons.shield, path: ArmorScreen(), buttonTitle: 'Armaduras'),
            MenuNavigationButton(
                icon: FontAwesomeIcons.sackDollar,
                path: EquipmentsScreen(),
                buttonTitle: "Equipamento"),
            MenuNavigationButton(
                icon: FontAwesomeIcons.dungeon,
                path: Home2Screen(),
                buttonTitle: "Para o Mestre"),
            Text(
              "\nCopyright 2022-2023\nGabriel \"Tri\" Torres Takahashi\n",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
            )
          ],
        ),
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/enhancer-logo2.png',
                scale: 4,
                color: Theme.of(context).colorScheme.primary,
              )),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text("RPGEnhancer\nv1.1",
                textAlign: TextAlign.center, style: titleText),
          )
        ],
      ),
    );
  }
}

class MenuNavigationButton extends StatelessWidget {
  final String buttonTitle;
  final Widget? path;
  final IconData? icon;
  const MenuNavigationButton(
      {this.icon, this.path, this.buttonTitle = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.085,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ElevatedButton(
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => path!));
        }),
        style: menuNavigationButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              buttonTitle,
              style: homeButtonText,
            ),
          ],
        ),
      ),
    );
  }
}
