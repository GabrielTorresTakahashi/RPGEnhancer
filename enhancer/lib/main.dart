import 'package:enhancer/screens/home.dart';
import 'package:enhancer/settings/color_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set preferred orientation for screen as Portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const Enhancer(),
    ),
  );
}

class Enhancer extends StatelessWidget {
  const Enhancer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: colorSettings,
    );
  }
}
