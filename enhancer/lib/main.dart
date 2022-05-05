import 'package:enhancer/screens/loot.dart';
import 'package:enhancer/settings/color_settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Enhancer());
}

class Enhancer extends StatelessWidget {
  const Enhancer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LootScreen(),
      theme: colorSettings,
    );
  }
}
