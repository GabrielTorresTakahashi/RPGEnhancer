import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class WeaponsScreen extends StatelessWidget {
  const WeaponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background, //scaffold color
      appBar: AppBar(
        title: Text(
          "Armas",
          style: appBarText,
        ),
        automaticallyImplyLeading: false,
      ),

    );
  }
}
