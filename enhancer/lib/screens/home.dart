import 'package:enhancer/screens/magic.dart';
import 'package:enhancer/screens/names.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

import 'loot.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.purple,
      drawerEnableOpenDragGesture: true,
      backgroundColor:
          Theme.of(context).colorScheme.background, //scaffold color

      appBar: AppBar(title: const Text("Home")),
      drawer: const MenuHamburguer(),

      body: Column(
        children: [
          const Center(
              child: FlutterLogo(
            size: 100,
          )),
          const AppTitle(),
          NavigationButton(const LootScreen(), "Tesouros"),
          NavigationButton(const MagicScreen(), "Itens Mágicos"),
          NavigationButton(const NameScreen(), "Nomes")
        ],
      ),
    );
  }
}

class MenuHamburguer extends StatelessWidget {
  const MenuHamburguer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Text(''),
          ),
          ListTile(
            leading: const FlutterLogo(),
            title: Text(
              'Idioma',
              style: menuText,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const FlutterLogo(),
            title: Text('Ajuda', style: menuText),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const FlutterLogo(),
            title: Text(
              'Sobre',
              style: menuText,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
          //CHILD #2
          "RPGEnhancer\nv0.1",
          textAlign: TextAlign.center,
          style: titleText),
      //END OF CHILD #2(
    );
  }
}

// ignore: must_be_immutable
class NavigationButton extends StatelessWidget {
  NavigationButton(this.path, this.buttonTitle, {Key? key}) : super(key: key);
  Widget? path;
  String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ElevatedButton(
        //CHILD #3
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => path!));
        }),
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.primary),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            buttonTitle,
            style: homeButtonText,
          ),
        ),
      ),
    ); //END OF CHILD #3;
  }
}
