

import 'dart:async';

class ChessGameBloc {

  String _currentGamePgn = "";
  final List<String> moves = [];
  int currentTurn = 0;

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