import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

import 'loot_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor, //scaffold color

      appBar: AppBar(title: const Text("Home")),
      drawer: const MenuHamburguer(),

      body: Column(
        children: [
          Center(
            //CHILD #1
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ), //END OF CHILD #1
          const AppTitle(),
          const LootButton(),
          const NameButton()
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
      backgroundColor: Theme.of(context).backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
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

class LootButton extends StatelessWidget {
  const LootButton({Key? key}) : super(key: key);

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
            context,
            MaterialPageRoute(builder: (context) => const LootGenerator()),
          );
        }),
        style:
            ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Tesouros",
            style: buttonText,
          ),
        ),
      ),
    ); //END OF CHILD #3;
  }
}

class NameButton extends StatelessWidget {
  const NameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ElevatedButton(
        //CHILD #3
        onPressed: (() {}),
        style:
            ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Nomes",
            style: buttonText,
          ),
        ),
      ),
    ); //END OF CHILD #3;
  }
}
