import 'dart:async';

import 'package:chessmindexpander/models/chess_opening.dart';

class ChessGameBloc {
  static const RUY_LOPEZ_OPENING_NAME = "Ruy Lopez";
  static const SICILIAN_DEFENSE_NAME = "Defesa Siciliana";
  static const QUEENS_GAMBIT_DEFENSE_NAME = "Gambito da Dama";
  static const SLAVE_DEFENSE_NAME = "Defesa Eslava";

  String _currentGamePgn = "";
  final List<String> moves = [];
  int currentTurn = 0;

  final Map<String, ChessOpening> chessOpenings = {
    RUY_LOPEZ_OPENING_NAME: ChessOpening.name(RUY_LOPEZ_OPENING_NAME,
        "1. e4 e5 2. Bb5 Nc6", '''
        1. e4 e5 
        2. Nf3 Nc6 
        3. Bb5
        
        A Ruy Lopez, também conhecida como a Abertura Espanhola, desenvolve rapidamente as peças da ala de rei e coloca pressão sobre o centro. 3... a6
        Este é o lance mais popular, mas muitos outros lances tem sido aqui jogados.
        '''),
    SICILIAN_DEFENSE_NAME:
        ChessOpening.name(SICILIAN_DEFENSE_NAME, "1. e4 c5", '''
          A Defesa Siciliana é a resposta mais popular das pretas ao lance "1.e4", principalmente entre enxadristas mais fortes. Ela permite às pretas a luta pelo centro, atacando diretamente a casa "d4", ao mesmo tempo que evita as posições simétricas que surgem a partir de "1...e5".
          Por ser tão popular, a defesa Siciliana também tem muitas variantes, todas elas bastante estudadas. A linha principal começa com a resposta 2...d6: 1.e4 c5 2.Nf3 d6 3.d4 cxd4 4.Nxd4 Nf6 5.Nc3, onde a resposta das pretas define as principais variantes:

          5...a6 : Variante Najdorf
          5...Nc6 : Variante Clássica
          5...e6 : Variante Scheveningen
          5...g6 : Variante Dragão
          
          Além destas, são também comuns o Gambito Smith-Morra, a Variante Alapin, a Variante Sveshnikov, a Dragão Acelerado e a Variante Scheveningen.
  '''),
    QUEENS_GAMBIT_DEFENSE_NAME:
        ChessOpening.name(QUEENS_GAMBIT_DEFENSE_NAME, "1. d4 d5 2. c4", '''
          O Gambito da Dama é uma abertura de xadrez do grupo das aberturas do peão da dama caracterizada pelos movimentos:
          
          1. d4 d5
          2. c4

          A variante em que as pretas capturam o peão em c4 é o Gambito da Dama Aceito, e as variantes com outros lances são o Gambito da Dama Recusado.
        '''),
    SLAVE_DEFENSE_NAME:
        ChessOpening.name(SLAVE_DEFENSE_NAME, "1. d4 d5 2. c4 c6", '''
           A Defesa Eslava é uma defesa de xadrez que se produz após os lances:
           
           1.d4 d5 
           2.c4 c6
           
           Esta defesa pertence ao grupo do Gambito da Dama Recusado, caracterizada.
        '''),
  };

  StreamController _chessGameStreamController = StreamController<String>();

  Sink get chessGameInput => _chessGameStreamController.sink;

  Stream get gameOutput => _chessGameStreamController.stream;

  void configureActionWhenGameChange(Function function) {
    gameOutput.listen(function);
  }

  void updateCurrentGame(String currentGame) {
    _currentGamePgn = currentGame;
    chessGameInput.add(_currentGamePgn);
  }

  void destroy() {
    chessGameInput.close();
  }
}
