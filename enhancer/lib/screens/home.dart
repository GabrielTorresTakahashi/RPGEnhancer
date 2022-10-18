import 'package:enhancer/screens/dice.dart';
import 'package:enhancer/screens/home2.dart';
import 'package:enhancer/screens/names.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'loot.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AppTitle(),
            MenuNavigationButton(
                icon: FontAwesomeIcons.coins,
                path: LootScreen(),
                buttonTitle: "Tesouros"),
            MenuNavigationButton(
                icon: FontAwesomeIcons.person,
                path: NameScreen(),
                buttonTitle: "Nomes"),
            MenuNavigationButton(
                icon: FontAwesomeIcons.diceD20,
                path: DiceScreen(),
                buttonTitle: "Dados"),
            MenuNavigationButton(
                icon: FontAwesomeIcons.circleQuestion,
                path: Home2Screen(),
                buttonTitle: "Diversos"),
            Text(
              "\nCopyright 2022\nGabriel Torres Takahashi\n",
              textAlign: TextAlign.center,
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
            child: Text(
              "RPGEnhancer\nv1.0",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
            Text(
              buttonTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
