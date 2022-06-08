import 'dart:async';

import 'package:chessmindexpander/models/chess_opening.dart';

class ChessGameBloc {
  static const ruyLopezOpeningName = "Ruy Lopez";
  static const sicilianDefenseName = "Defesa Siciliana";
  static const queensGambitDefenseName = "Gambito da Dama";
  static const slavDefenseName = "Defesa Eslava";

  String _currentGamePgn = "";
  final List<String> moves = [];
  int currentTurn = 0;

  final Map<String, ChessOpening> chessOpenings = {
    ruyLopezOpeningName: ChessOpening.name(
        ruyLopezOpeningName,
        "1. e4 e5 2. Bb5 Nc6",
        '''
        1. e4 e5 
        2. Nf3 Nc6 
        3. Bb5
        '''),
    sicilianDefenseName: ChessOpening.name(
        sicilianDefenseName,
        "1. e4 c5",
        ''''''),
    queensGambitDefenseName: ChessOpening.name(
        queensGambitDefenseName,
        "1. d4 d5 2. c4",
        '''
        '''),
    slavDefenseName: ChessOpening.name(
        slavDefenseName,
        "1. d4 d5 2. c4 c6",
        '''
        '''),
  };

  final StreamController _chessGameStreamController = StreamController<String>();

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
