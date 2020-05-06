

import 'dart:async';

class ChessGameBloc {

  static const RUY_LOPEZ_OPENING_NAME = "Ruy Lopez";
  static const SICILIAN_DEFENSE_NAME = "Defesa Siciliana";
  static const QUEENS_GAMBIT_DEFENSE_NAME = "Gambito da Dama";
  static const SLAVE_DEFENSE_NAME = "Defesa Eslava";


  String _currentGamePgn = "";
  final List<String> moves = [];
  int currentTurn = 0;

  final List<String> chessOpenings = [
    "e4", "e5", "Bb5", "Kc6"
  ];

  final Map<String, String> chessOpeningsPgn = {
    RUY_LOPEZ_OPENING_NAME : "1. e4 e5 2. Bb5 Nc6",
    SICILIAN_DEFENSE_NAME : "1. e4 c5",
    QUEENS_GAMBIT_DEFENSE_NAME : "1. d4 d5 2. c4",
    SLAVE_DEFENSE_NAME : "1. d4 d5 2. c4 c6",
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