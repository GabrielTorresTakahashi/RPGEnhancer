import 'dart:math';

import 'package:enhancer/models/refresh_button.dart';
import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(titleTextStyle: appBarText, title: const Text("Clima")),
      body: const Weather(),
    );
  }
}

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    List<String> weather = [
      'Tempo Limpo',
      'Chuviscando',
      'Chovendo',
      'Tempestade',
      'Sem vento',
      'Brisa Suave',
      'Ventania Mortal',
      'Temperatura Média',
      'Levemente Quente',
      'Levemente Frio',
      'Calor Extremo',
      'Frio Extremo'
    ];
    List<String> weatherEffects = [
      'O céu está limpo. Não impõe qualquer efeito adicional',
      'Algumas nuvens cobrem o céu, fazendo com que '
          'chova levemente. Andar sob areia ou terra, mas não em estradas '
          ' de terra sob esta condição é considerado terreno difícil.',
      'O céu foi coberto por núvens, que '
          'também cobrem levemente o sol. Lugares abertos são considerados '
          'penumbra, impondo desvantagem em testes de percepção. '
          'Além disso, andar sob areia, terra ou pedras escorregadias '
          'é considerado terreno difícil.',
      'O céu escurece, sendo coberto por enormes '
          'nuvens negras. Lugares abertos são considerados escuridão '
          'total. Qualquer superfície que não seja estrada '
          'é considerada terreno difícil. Além disso, dano de fogo '
          'é cortado pela metade.',
      'A natureza é menos barulhenta, '
          'fazendo com que seja mais fácil notar barulhos externos. '
          'Testes de Destreza(Furtividade) são feitos com desvantagem '
          'caso o personagem não possua proficiência',
      'Os ventos estão normais. '
          'Não impõe qualquer efeito adicional.',
      'Os ventos estão agitados, '
          'emitindo barulhos extremamente altos e soprando '
          'os fracos para longe. Qualquer personagem que possua força '
          'menor que 13 realiza um teste de resistência de Força(Atletismo) '
          'CD 12 será empurrado 1,5m para o Oeste. Além disso, voar '
          'por meios não mágicos é impossível.',
      'Tempertatura normal do ambiente. '
          'Não impõe qualquer efeito adicional.',
      'O clima é mais quente. Caso '
          'o clima normal seja frio, este efeito remove '
          'as penalidades de frio.',
      'O clima é mais frio. Caso o '
          'clima normal seja quente, este efeito remove '
          'as penalidades de calor.',
      'O clima é extremamente mais quente, '
          'fazendo-se necessário realizar pausas '
          ' mais frequentes para beber água e descansar. '
          'A cada 3 horas um personagem precisa de '
          'um descanso curto e ingerir 500ml água. '
          'Caso isso não aconteça, o personagem ganha 1'
          'nível de exaustão. Criaturas com resistência '
          'a dano de fogo não sofrem esta desvantagem.',
      'O clima é mortalmente congelante. '
          'Com a temperatura baixa, faz-se necessário '
          'o uso de roupas de frio. A cada 2 horas, uma'
          'criatura desprotegida faz um teste de resistência '
          'de constituição CD 15. Em uma falha, a criatura sofre '
          'um nível de exaustão. Caso a criatura use roupas de '
          'viagem, o teste não é necessário. Descansos longos '
          'em lugares expostos a este clima são impossíveis sem '
          'uma tenda, um cobertor de inverno e uma fogueira. '
          'Criaturas com resistência a dano de frio não sofrem '
          'estes efeitos.'
    ];

    int rain = Random().nextInt(4);
    int wind = Random().nextInt(3) + 4;
    int temp = Random().nextInt(3) + 7;
    return ListView(
      children: [
        Center(
            child: RefreshButton(
          setState: setState,
          marginTop: 30,
          marginBottom: 10,
        )),

        //Umidade
        ListTile(
            title: Text(weather[rain], style: titleText),
            subtitle: Text(
              weatherEffects[rain],
              style: listTileText,
            )),
        //Vento
        ListTile(
            title: Text(weather[wind], style: titleText),
            subtitle: Text(
              weatherEffects[wind],
              style: listTileText,
            )),
        //Temperatura
        ListTile(
            title: Text(weather[temp], style: titleText),
            subtitle: Text(
              weatherEffects[temp],
              style: listTileText,
            )),
      ],
    );
  }
}
