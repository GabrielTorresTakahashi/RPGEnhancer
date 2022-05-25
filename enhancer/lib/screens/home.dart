import 'package:enhancer/screens/magic.dart';
import 'package:enhancer/screens/names.dart';
import 'package:enhancer/settings/color_settings.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

import 'loot.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background, //scaffold color

      appBar: AppBar(
        title: const Text("Home"), automaticallyImplyLeading: false,),
      body: Column(
        children: const [
          AppTitle(),
          MenuNavigationButton(LootScreen(), "Tesouros"),
          MenuNavigationButton(MagicScreen(), "Itens Mágicos"),
          MenuNavigationButton(NameScreen(), "Nomes")
        ],
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
          Container(margin: const EdgeInsets.only(top: 10), child: Image.asset('assets/enhancer-logo2.png', scale: 4)),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text("RPGEnhancer\nv1.0",
                textAlign: TextAlign.center, style: titleText),
          ),
        ],
      ),
    );
  }
}

class MenuNavigationButton extends StatelessWidget {
  final String buttonTitle;
  final Widget? path;
  const MenuNavigationButton(this.path, this.buttonTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ElevatedButton(
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => path!));
        }),
        style: menuNavigationButton,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            buttonTitle,
            style: homeButtonText,
          ),
        ),
      ),
    );
  }
}
