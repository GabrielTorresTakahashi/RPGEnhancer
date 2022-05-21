import 'dart:math';

import 'package:enhancer/settings/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MagicItem extends StatelessWidget {
  static Random random = Random();
  final String rarity;
  final bool placeholder;
  const MagicItem({Key? key, required this.rarity, this.placeholder = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    String item = ' ';
    Color rarityColor = Colors.transparent;
    int d100 = random.nextInt(100) + 1;

    switch (rarity) {
      case '-Raridade-':
        if (placeholder) {
          item = 'Selecione um nível de raridade';
        }
        break;
      case 'Raridade A':
        rarityColor = Colors.grey;
        if (d100 == 100) {
          item = 'Globo de fluxo';
          break;
        }
        if (d100 == 99) {
          item = 'Mochila de carga';
          break;
        }
        if (d100 >= 95) {
          item = 'Poção de cura maior';
          break;
        }
        if (d100 >= 91) {
          item = 'Pergaminho de magia (2º Nível)';
          break;
        }
        if (d100 >= 71) {
          item = 'Pergaminho de magia (1º Nível)';
          break;
        }
        if (d100 >= 61) {
          item = 'Poção de escalar';
          break;
        }
        if (d100 >= 51) {
          item = 'Pergaminho de magia (truque)';
          break;
        }
        item = 'Poção de cura';
        break;

      case 'Raridade B':
        rarityColor = Colors.white;
        List<String> table = [
          'Poção de cura maior',
          'Poção de sopro de fogo',
          'Poção de resistência',
          'Munição +1',
          'Poção de amizade animal',
          'Polçao de força do gigante da colina',
          'Poção de aumentar',
          'Poção de respirar na água',
          'Pergaminho de magia (2º Nível)',
          'Pergaminho de magia (3º Nível)',
          'Mochila de carga',
          'Unguento de Keoghtom',
          'Óleo escorregadio',
          'Pó do desaparecimento',
          'Pó da seca',
          'Pó de espirrar e tossir',
          'Gema elemental',
          'Filtro do amor',
          'Jarro de alquimia',
          'Capa de respirar na água',
          'Manto da arraia',
          'Globo de fluxo',
          'Óculos noturnos',
          'Elmo de compreensão de idiomas',
          'Bastão imóvel',
          'Lanterna de revelação',
          'Arnadura do marinheiro',
          'Armadura de mitral',
          'Poção de envenenamento',
          'Anel de natação',
          'Robe dos itens úteis',
          'Corda de escalada',
          'Sela do cavaleiro',
          'Varinha de detectar magia',
          'Varinha de segredos',
        ];
        item = table[random.nextInt(table.length)];
        break;
      case 'Raridade C':
        rarityColor = Colors.green;
        List<String> table = [
          'Poção de cura maior',
          'Pergaminho de magia (4º Nível)',
          'Munição +2',
          'Poção de clarividência',
          'Poção de encolher',
          'Poção de forma gasosa',
          'Poção de força do gigante de gelo',
          'Poção de força do gigante de pedra',
          'Poção de heroismo',
          'Poção de invulnerabilidade',
          'Poção de ler mentes',
          'Pergaminho de magia (5º Nível)',
          'Elixir de saúde',
          'Óleo de forma gasosa',
          'Poção de força do gigante de fogo',
          'Pena de Quaal',
          'Pergaminho de proteção',
          'Saco de feijões',
          'Contas de força',
          'Carrilhão de abertura',
          'Decantador de água infinita',
          'Olhos de visão momentânea',
          'Barco dobrável',
          'Sacola prestativa de Heward',
          'Ferraduras da velocidade',
          'Colar de bolas de fogo',
          'Periapto da saúde',
          'Pedras de mensagem',
        ];
        item = table[random.nextInt(table.length)];
        break;
      case 'Raridade D':
        rarityColor = Colors.blue;
        List<String> table = [
          'Poção de cura suprema',
          'Poção de invisibilidade',
          'Poção de velocidade',
          'Pergaminho de magia(6º Nível)',
          'Pergaminho de magia(7º Nível)',
          'Munição +3',
          'Óleo de precisão',
          'Poção de voo',
          'Poção de força do gigante das nuvens',
          'Poção de longevidade',
          'Poção de vitalidade',
          'Pergaminho de magia (8º Nível)',
          'Ferraduras de zéfiro',
          'Pigmentos maravilhosos de Nolzur',
          'Bolsa devoradora',
          'Buraco porátil',
        ];
        item = table[random.nextInt(table.length)];
        break;
      case 'Raridade E':
        rarityColor = Colors.indigo;
        if (d100 >= 99) {
          item = 'Cola soberana';
          break;
        }
        if (d100 >= 94) {
          item = 'Flecha Assassina';
          break;
        }
        if (d100 >= 86) {
          item = 'Solvente universal';
          break;
        }
        if (d100 >= 71) {
          item = 'Pergaminho de magia (9º Nível)';
          break;
        }
        if (d100 >= 56) {
          item = 'Poção de cura suprema';
          break;
        }
        if (d100 >= 31) {
          item = 'Poção de força do gigante da tempestade';
          break;
        }
        item = 'Pergaminho de magia (8º Nível)';
        break;
      case 'Raridade F':
        rarityColor = Colors.purple;
        List<String> table = [
          'Arma +1',
          'Escudo +1',
          'Escudo sentinela',
          'Amuleto de proteção contra detecção e localização',
          'Botas élficas',
          'Botas de caminhar e saltar',
          'Braçadeiras de arquearia',
          'Broche do escudo',
          'Vassoura voadora',
          'Manto élfico',
          'Manto de proteção',
          'Manoplas de força do ogro',
          'Chapéu de disfarce',
          'Azagaia de relâmpago',
          'Pérola do poder',
          'Bastão guardião de pactos +1',
          'Sandálias de patas de aranha',
          'Cajado da víbora',
          'Cajado da píton',
          'Espada da vingança',
          'Tridente de comandar peixes',
          'Varinha de misseis mágicos',
          'Varinha do arcano de guerra +1',
          'Varinha de teia',
          'Arma de alerta',
          'Armadura de adamante (cota de malha)',
          'Armadura de adamante (camisão de malha)',
          'Armadura de adamante (brunea)',
          'Bolsa de truques (cinza)',
          'Bolsa de truques (ferrugem)',
          'Bolsa de truques (bronze)',
          'Botas do inverno',
          'Diadema da destruição',
          'Baralho das ilusões',
          'Garrafa da fumaça eterna',
          'Olhos do encantamento',
          'Olhos de águia',
          'Estátua de poderes incríveis (corvo de prata)',
          'Gema da luminosidade',
          'Luvas de apanhar projeteis',
          'Luvas de nadar e escalar',
          'Luvas do ladrão',
          'Tiara do intelecto',
          'Elmo de telepatia',
          'Instrumento dos bardos (alaúde de Doss)',
          'Instrumento dos bardos (bandolim de Fochlucan)',
          'Instrumento dos bardos (citara de Mac-Fuimidh)',
          'Medalhão de pensamentos',
          'Colar de adaptação',
          'Periapto da cicatrização',
          'Flauta assombrada',
          'Flauta dos esgotos',
          'Anel de saltar',
          'Anel de escudo mental',
          'Anel de calor',
          'Anel de andar na água',
          'Aljava de Ehlonna',
          'Pedra da boa sorte',
          'Leque do vento',
          'Botas aladas',
        ];
        item = table[random.nextInt(table.length)];
        break;
      case 'Raridade G':
        rarityColor = Colors.pink;
        List<String> table = [
          'Arma +2',
          'Grifo de bronze',
          'Mosca de ébano',
          'Leões dourados',
          'Bodes de marfim',
          'Elefante de mármore',
          'Cão de ônix',
          'Coruja de serpentina',
          'Armadura de adamante (peitoral)',
          'Armadura de adamante (cota de talas)',
          'Amuleto de saúde',
          'Armadura de vulnerabilidade',
          'Escudo apanhador de flechas',
          'Cinto dos anões',
          'Cinturão de força do gigante da colina',
          'Machado furioso',
          'Botas de levitação',
          'Botas de velocidade',
          'Bacia de comandar elementais da água',
          'Braceletes de defesa',
          'Braseiro de comandar elementais do fogo',
          'Capa do saltimbanco',
          'Incensório de comandar elementais do ar',
          'Cota de malha +1',
          'Armadura da resistência (cota de malha)',
          'Camisão de malha +1',
          'Armadura da resistência (camisão de malha)',
          'Manto de deslocamento',
          'Manto do morcego',
          'Cubo de força',
          'Fortaleza instantânea de Daern',
          'Adaga de envenenamento',
          'Algemas dimensionais',
          'Matadora de dragões',
          'Malha élfica',
          'Língua flamejante',
          'Gema de visão',
          'Matador de gigantes',
          'Couro batido encantador',
          'Elmo de teletransporte',
          'Trombeta da destruição',
          'Trombeta do Valhalla (prata e latão)',
          'Instrumento dos bardos (mandolim de Canaith)',
          'Instrumento dos bardos (lira de Cli)',
          'Pedra iônica (prontidão)',
          'Pedra iônica (proteção)',
          'Pedra iônica (armazenamento)',
          'Pedra iônica (sustento)',
          'Faixas de ferro de Bilarro',
          'Armadura de couro +1',
          'Armadura de resistência (couro)',
          'Maça do rompimento',
          'Maça de destruição',
          'Maça do terror',
          'Manto de resistência à magia',
          'Corrente de contas de oração',
          'Periapto de proteção contra veneno',
          'Anel de cativar animais',
          'Anel de evasão',
          'Anel de queda suave',
          'Anel de ação livre',
          'Anel de proteção',
          'Anel de resistência',
          'Anel de armazenar magia',
          'Anel do aríete',
          'Anel de visão de raio-X',
          'Robe dos olhos',
          'Bastão da obediência',
          'Bastão guardião de pactos +2',
          'Corda de estrangulamento',
          'Brunea +1',
          'Armadura de resistência (brunea)',
          'Escudo +2',
          'Escudo de atração de projeteis',
          'Cajado de enfeitiçar',
          'Cajado de cura',
          'Cajado de enxame de insetos',
          'Cajado das florestas',
          'Cajado do definhamento',
          'Pedra de comandar elementais da terra',
          'Lâmina do sol',
          'Espada do furto de vidas',
          'Espada do sangramento',
          'Bastão do tentáculo',
          'Arma viciosa',
          'Varinha de obrigação',
          'Varinha de detecção de inimigos',
          'Varinha de medo',
          'Varinha de bolas de fogo',
          'Varinhas de relâmpagos',
          'Varinha de paralisia',
          'Varinha do arcano de guerra +2',
          'Varinha das maravilhas',
          'Asas voadoras',
        ];
        item = table[random.nextInt(table.length)];
        break;
      case 'Raridade H':
        rarityColor = Colors.amber;
        List<String> table = [
          'Arma +3',
          'Amuleto dos planos',
          'Tapete voador',
          'Bola de cristal (versão muito rara)',
          'Anel de regeneração',
          'Anel de estrelas cadentes',
          'Anel de telecinésia',
          'Robe das cores cintilantes',
          'Robe das estrelas',
          'Bastão de absorção',
          'Bastão de prontidão',
          'Bastão de segurança',
          'Bastão guardião de pactos +3',
          'Cimitarra da velocidade',
          'Escudo +3',
          'Cajado do fogo',
          'Cajado do frio',
          'Cajado do poder',
          'Cajado de ataque',
          'Cajado de trovão e relâmpago',
          'Espada decepadora',
          'Varinha de metamorfose',
          'Varinha do arcano de guerra +3',
          'Armadura de adamante (meia-armadura)',
          'Armadura de adamante (placas)',
          'Escudo animado',
          'Cinturão de força do gigante do fogo',
          'Cinturão de força do gigante do frio (ou de pedra)',
          'Peitoral +1',
          'Armadura de resistência (peitoral)',
          'Vela da invocação',
          'Cota de malha +2',
          'Camisão de malha +2',
          'Manto da aranha',
          'Espada dançarina',
          'Armadura demoníaca',
          'Brunea de escamas de dragão',
          'Armadura anã',
          'Arremessador anão',
          'Garrafa do efreeti',
          'Estátua de poderes incríveis (corcel de obsidiana)',
          'Marca congelante',
          'Elmo brilhante',
          'Trombeta do Valhalla (bronze)',
          'Instrumento dos bardos (harpa de Anstruth)',
          'Pedra iônica (absorção)',
          'Pedra iônica (agilidade)',
          'Pedra iônica (fortitude)',
          'Pedra iônica (intuição)',
          'Pedra iônica (intelecto)',
          'Pedra iônica (liderança)',
          'Pedra iônica (força)',
          'Armadura de couro +2',
          'Manual da saúde corporal',
          'Manual do bom exercício',
          'Manual dos golens',
          'Manual da rapidez de movimentos',
          'Espelho do aprisionamento',
          'Ladra das nove vidas',
          'Arco do juramento',
          'Brunea +2',
          'Escudo de proteção contra magia',
          'Cota de talas +1',
          'Armadura de resistência (cota de talas)',
          'Armadura de couro batido +1',
          'Armadura de resistência (couro batido)',
          'Tomo dos grandes pensamentos',
          'Tomo de liderança e influência',
          'Tomo da compreensão',
        ];
        item = table[random.nextInt(table.length)];
        break;
      case 'Raridade I':
        rarityColor = Colors.lime;
        List<String> table = [
          'Defensora',
          'Martelo dos trovões',
          'Lâmina da sorte',
          'Espada de retaliação',
          'Vingadora sagrada',
          'Anel de invocação de djinni',
          'Anel de invisibilidade',
          'Anel de refletir magias',
          'Bastão do grande poder',
          'Cajado do arcano',
          'Espada vorpal',
          'Cinturão de força do gigante das nuvens',
          'Peitoral +2',
          'Cota de malha +3',
          'Camisão de malha +3',
          'Manto de invisibilidade',
          'Bola de cristal (versão lendária)',
          'Meia-armadura +1',
          'Frasco de ferro',
          'Armadura de couro +3',
          'Armadura de placas +1',
          'Robe do arquimago',
          'Bastão de ressurreição',
          'Brunea +1',
          'Escaravelho da proteção',
          'Cota de talas +2',
          'Armadura de couro batido +2',
          'Poço dos muitos mundos',
          'Meia-armadura +2',
          'Armadura de placas +2',
          'Armadura de couro batido +3',
          'Peitoral +3',
          'Cota de talas +3',
          'Meia-armadura +3',
          'Armadura de placas +3',
          'Dispositivo de Kwalish',
          'Armadura de invulnerabilidade',
          'Cinturão de força do gigante da tempestade',
          'Cubo do portal',
          'Baralho das surpresas',
          'Malha do efreeti',
          'Armadura de resistência (meia-armadura)',
          'Trombeta do Valhalla (ferro)',
          'Instrumento dos bardos (harpa de Ollamh)',
          'Pedra iônica (absorção maior)',
          'Pedra iônica (maestria)',
          'Pedra iônica (regeneração)',
          'Armadura de placas da forma etérea',
          'Armadura de placas da resistência',
          'Anel de comandar elementais do ar',
          'Anel de comandar elementais da terra',
          'Anel de comandar elementais do fogo',
          'Anel dos três desejos',
          'Anel de comandar elementais da água',
          'Esfera da aniquilação',
          'Talismã da bondade pura',
          'Talismã da esfera',
          'Talismã do mal absoluto',
          'Tomo da língua quieta',
        ];
        item = table[random.nextInt(table.length)];
        break;
    }
    return ListTile(
      leading: Icon(
        FontAwesomeIcons.wandMagicSparkles,
        size: 40,
        color: rarityColor,
      ),
      title: Text(
        item,
        style: itemText,
      ),
    );
  }
}
