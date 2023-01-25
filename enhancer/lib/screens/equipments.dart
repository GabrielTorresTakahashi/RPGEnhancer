import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class EquipmentsScreen extends StatelessWidget {
  const EquipmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Equipamento", style: appBarText),
      ),
    );
  }
}
