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
    /*
    const Color background = Color(0xFF303030);
    const Color primary = Color(0xFF99121D);
     */
    const Color background = Color(0xFF303030);
    const Color primary = Colors.deepPurple;
    const Color textColor = Colors.white;

    return MaterialApp(
      home: const Splash(),
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.black, opacity: 1),
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: textColor,
            displayColor: textColor,
            fontFamily: 'Montserrat'),
        scaffoldBackgroundColor: background,
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: primary, onPrimary: textColor, secondary: primary),
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
        ),
      ),
    );
  }
}
