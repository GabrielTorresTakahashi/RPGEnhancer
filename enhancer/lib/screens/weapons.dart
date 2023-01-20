import 'package:enhancer/database/weapon_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeaponsScreen extends StatefulWidget {
  const WeaponsScreen({Key? key}) : super(key: key);

  @override
  State<WeaponsScreen> createState() => _WeaponsScreenState();
}

class _WeaponsScreenState extends State<WeaponsScreen> {
  @override
  Widget build(BuildContext context) {
    final weapon = context.watch<WeaponRepository>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Armas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text('Nome'),
              subtitle: Text(weapon.),
            )
          ],
        ),
      ),
    );
  }
}
