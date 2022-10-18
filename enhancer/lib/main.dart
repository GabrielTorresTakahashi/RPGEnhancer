import 'package:enhancer/screens/home.dart';
import 'package:enhancer/settings/color_settings.dart';
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
    /*
    const Color background = Color(0xFF303030);
    const Color primary = Color(0xFF99121D);
     */
    const Color background = Color(0xFF303030);
    const Color primary = Colors.deepPurple;
    const Color textColor = Colors.white;

    return MaterialApp(
      home: const HomeScreen(),
      theme: colorSettings,
    );
  }
}
