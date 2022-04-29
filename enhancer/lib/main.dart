import 'package:enhancer/screens/home.dart';
import 'package:enhancer/settings/colorSettings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Enhancer());
}


class Enhancer extends StatelessWidget {
  const Enhancer({ Key? key }) : super(key: key);

  //cores
  static const Color primary = Color(0xFF81171b);
  static const Color background = Color(0xFF540804);
  //cores

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),

      theme: colorSettings,
    );
  }
}