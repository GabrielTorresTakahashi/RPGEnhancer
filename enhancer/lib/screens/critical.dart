import 'dart:math';

import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CriticalScreen extends StatelessWidget {
  const CriticalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text("Críticos", style: appBarText)),
      body: ListView(
        children: [
          Text("Escolha o Tipo de Dano",
              style: titleText, textAlign: TextAlign.center),
          const CriticalEffect(
            title: "Ácido",
            icon: FontAwesomeIcons.flaskVial,
            iconColor: Colors.green,
          ),
          const CriticalEffect(
            title: "Concussão",
            icon: FontAwesomeIcons.hammer,
            iconColor: Colors.grey,
          ),
          const CriticalEffect(
            title: "Cortante",
            icon: FontAwesomeIcons.scissors,
            iconColor: Colors.grey,
          ),
          const CriticalEffect(
            title: "Elétrico",
            icon: FontAwesomeIcons.bolt,
            iconColor: Colors.yellow,
          ),
          const CriticalEffect(
            title: "Energia",
            icon: FontAwesomeIcons.hatWizard,
            iconColor: Colors.purple,
          ),
          const CriticalEffect(
            title: "Fogo",
            icon: FontAwesomeIcons.fireFlameCurved,
            iconColor: Colors.orange,
          ),
          const CriticalEffect(
            title: "Frio",
            icon: FontAwesomeIcons.snowflake,
            iconColor: Colors.white,
          ),
          const CriticalEffect(
            title: "Necrótico",
            icon: FontAwesomeIcons.skull,
            iconColor: Colors.deepPurple,
          ),
          const CriticalEffect(
            title: "Perfurante",
            icon: FontAwesomeIcons.bahai,
            iconColor: Colors.grey,
          ),
          const CriticalEffect(
            title: "Psíquico",
            icon: FontAwesomeIcons.brain,
            iconColor: Colors.blue,
          ),
          const CriticalEffect(
            title: "Radiante",
            icon: FontAwesomeIcons.starOfDavid,
            iconColor: Colors.yellow,
          ),
          const CriticalEffect(
            title: "Trovejante",
            icon: FontAwesomeIcons.volumeHigh,
            iconColor: Colors.white,
          ),
          const CriticalEffect(
            title: "Veneno",
            icon: FontAwesomeIcons.skullCrossbones,
            iconColor: Colors.lightGreen,
          ),
        ],
      ),
    );
  }
}

class CriticalEffect extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Text? subtitle;
  final Color iconColor;
  const CriticalEffect({
    Key? key,
    this.iconColor = Colors.white,
    required this.title,
    this.icon,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: iconColor,
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: listTileText,
      ),
      subtitle: subtitle,
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) {
              return Critical(
                type: title,
              );
            });
      },
    );
  }
}

class Critical extends StatelessWidget {
  final String type;
  const Critical({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description;
    List effects;

    switch (type) {
      case 'Ácido':
        effects = [
          'A armadura do alvo é corroída, dando uma '
              'penalidade de -1 na CA.',
          'O ácido espirra nos olhos do alvo, deixando'
              '-o cego até o fim do seu próximo turno',
          'O ácido cai sobre a arma do alvo, causando '
              'uma penalidade de 1 nas jogadas de dano.',
          'O ácido foi tão forte que corroeu um dos membros '
              'do alvo. O membro corroído é comprometido.'
        ];
        break;
      case 'Concussão':
        effects = [
          'O impacto do ataque foi tão forte que agora '
              'o alvo está caído.',
          'Um dos braços do alvo foi quebrado pelo '
              'impacto. O braço quebrado é inutilizado.',
          'O alvo está atordoado até o fim de seu próximo '
              'turno.',
          'O alvo recebeu um impacto extremamente forte, '
              'fazendo ossos internos se quebrarem. O '
              'deslocamento do alvo foi reduzido em 3 metros '
              'até o final de seu próximo turno.'
        ];
        break;
      case 'Cortante':
        effects = [
          'O corte foi fatal, fazendo o alvo '
              'se machucar muito mais do que o esperado. '
              'O alvo recebe 1d10 de dano necrótico.',
          'O ataque cortante acertou a arma do oponente. '
              'devido à grande força do ataque, o alvo foi desarmado.',
          'O corte expôs o alvo a ataques iminentes. '
              'Ataques contra o alvo possuem vantagem até '
              'o fim de seu próximo turno.',
          'O ataque fatiou um dos membros do alvo. '
              'O membro fatiado é inutilizado.'
        ];
        break;
      case 'Elétrico':
        effects = [
          'A força da corrente elétrica fez o alvo'
              'ficar atordoado até o início de seu '
              'próximo turno.',
          'A corrente elétrica acertou o sistema '
              'nervoso do alvo, fazendo-o ficar paralisado '
              'até o início de seu próximo turno.',
          'O choque afetou a mente do alvo. '
              'O alvo perdeu a capacidade de formular '
              'frases por 10 minutos.',
          'A corrente elétrica fez o alvo ficar surdo.'
        ];
        break;
      case 'Energia':
        effects = [
          'O efeito mágico afetou as energias '
              'ao redor do alvo, despertando a magia '
              'selvagem. Mãos espectrais agarram o '
              'alvo até o início de seu próximo turno. ',
          'O alvo está envolto por uma luz feérica '
              'que muda de cor, emitindo luz plena por 1,5m. '
              'O alvo não recebe vantagem por estar invisível '
              'e ataques contra o alvo possuem vantagem.',
          'O efeito da energia suprimiu a força mágica '
              'do alvo. O alvo não pode conjurar magias de '
              '2º nível ou superior até o início de seu próximo '
              'turno.',
          'A energia suprimiu os efeitos mágicos '
              'em volta do alvo. Qualquer magia que o alvo '
              'tenha conjurado é dissipada.'
        ];
        break;
      case 'Fogo':
        effects = [
          'O fogo foi muito assustador para o alvo. '
              'O alvo está amedrontado por você até '
              'O início de seu próximo turno. ',
          'O fogo queimou a pele do alvo, expondo '
              'feridas graves. O alvo é vulnerável '
              'a dano de fogo durante 1 minuto.',
          'O fogo removeu as capacidades do alvo '
              'de se controlar. O alvo está envenenado até '
              'o início de seu próximo turno',
          'O impacto do fogo derrubou o alvo. '
              'O alvo está caído.'
        ];
        break;
      case 'Frio':
        effects = [
          'A temperatura abaixou a um nível '
              'catastrófico em volta do alvo. '
              'O alvo se tornou uma pedra de gelo e '
              'está petrificado até o fim de seu próximo turno. ',
          'O frio reduziu drasticamente a capacidade de '
              'movimento do alvo. O alvo está impedido até o início '
              'de seu próximo turno.',
          'O frio afetou o corpo do alvo. O alvo está'
              'paralisado até o início de seu próximo turno.',
          'A baixa temperatura afetou o alvo de forma '
              'inexplicável. O alvo está vulnerável a frio por '
              '1 minuto.'
        ];
        break;
      case 'Necrótico':
        effects = [
          'O alvo viu sua vida passando em um flash.'
              'O alvo está amedrontado por você até o início '
              'de seu próximo turno.',
          'O dano necrótico secou a mente do alvo, '
              'deixando-o desorientado. O alvo está cego '
              'até o início de seu próximo turno.',
          'As pernas do alvo cedem, devido ao dano.'
              'O alvo está caído.',
          'A pele do alvo seca. O alvo está '
              'vulnerável a fogo até o início do seu '
              'próximo turno.'
        ];
        break;
      case 'Perfurante':
        effects = [
          'O alvo sofre 1d6 de dano necrótico extra '
              'devido ao sangramento causado pela ferida.',
          'A armadura do alvo foi prejudicada devido '
              'ao ataque. A CA do alvo diminui em 1 ponto.',
          'O alvo cai devido ao grande impacto. O alvo está caído.',
          'O alvo sofre uma dor tremenda do ataque. O alvo está '
              'impedido até o início de seu próximo turno.'
        ];
        break;
      case 'Psíquico':
        effects = [
          'O alvo se esqueceu completamente de você '
              'devido à confusão causada pelo ataque. O '
              'alvo está enfeitiçado por você até o início '
              'de seu próximo turno.',
          'O alvo se esqueceu do que estava fazendo '
              'devido à confusão do ataque. O alvo está '
              'atordoado até o início de seu próximo turno.',
          'O alvo viu coisas que nenhuma criatura deveria '
              'jamais ver. O alvo está amedrontado por você '
              'até o início de seu próximo turno.',
          'O alvo ficou confuso pelo ataque e '
          'começou a rir compulsivamente'
        ];
        break;
      default:
        effects = ['COULD NOT IDENTIFY DAMAGE TYPE'];
    }
    description = effects[Random().nextInt(effects.length)];
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: Text(description, style: lootText2),
    );
  }
}
