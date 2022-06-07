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
    RUY_LOPEZ_OPENING_NAME: ChessOpening.name(
        RUY_LOPEZ_OPENING_NAME,
        "1. e4 e5 2. Bb5 Nc6",
        '''
        1. e4 e5 
        2. Nf3 Nc6 
        3. Bb5
        '''),
    SICILIAN_DEFENSE_NAME: ChessOpening.name(
        SICILIAN_DEFENSE_NAME,
        "1. e4 c5",
        ''''''),
    QUEENS_GAMBIT_DEFENSE_NAME: ChessOpening.name(
        QUEENS_GAMBIT_DEFENSE_NAME,
        "1. d4 d5 2. c4",
        '''
          O Gambito da Dama é uma abertura de xadrez do grupo das aberturas do peão da dama caracterizada pelos movimentos:
          
          1. d4 d5
          2. c4

          A variante em que as pretas capturam o peão em c4 é o Gambito da Dama Aceito, e as variantes com outros lances são o Gambito da Dama Recusado.
        '''),
    SLAVE_DEFENSE_NAME: ChessOpening.name(
        SLAVE_DEFENSE_NAME,
        "1. d4 d5 2. c4 c6",
        '''
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
