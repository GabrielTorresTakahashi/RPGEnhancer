import 'package:enhancer/settings/color_settings.dart';
import 'package:enhancer/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const Enhancer()));
}

class Enhancer extends StatelessWidget {
  const Enhancer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splash(),
      theme: colorSettings,
    );
  }
}
