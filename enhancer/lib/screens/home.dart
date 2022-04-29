import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor, //scaffold color

        appBar: AppBar(),
        drawer: const MenuHamburguer(),

        body: Column(
          children: [
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            )
          ],
        ));
  }
}

class MenuHamburguer extends StatelessWidget {

  const MenuHamburguer({ Key? key }) : super(key: key);

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
                title: const Text('Idioma'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const FlutterLogo(),
                title: const Text('Ajuda'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const FlutterLogo(),
                title: const Text('Sobre'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
  }
}
