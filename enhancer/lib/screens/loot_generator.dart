import 'package:flutter/material.dart';

class LootGenerator extends StatelessWidget {
  const LootGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        LevelType(),
      ],
    ));
  }
}

class LevelType extends StatelessWidget {
  const LevelType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
