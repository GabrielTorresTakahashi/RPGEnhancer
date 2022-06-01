import 'package:enhancer/screens/home.dart';
import 'package:enhancer/screens/weather.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../settings/text_style.dart';
import 'critical.dart';

class Home2Screen extends StatelessWidget {
  const Home2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(titleTextStyle: appBarText, title: const Text("Diversos")),
      body: const Home2(),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: const [
        MenuNavigationButton(icon: Icons.cloudy_snowing,path: WeatherScreen(), buttonTitle: 'Clima'),
        MenuNavigationButton(icon: FontAwesomeIcons.heartPulse,path: CriticalScreen(), buttonTitle: 'Críticos'),
        
      ],
    );
  }
}
