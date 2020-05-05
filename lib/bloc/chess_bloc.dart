

import 'dart:async';

class ChessGameBloc {

  String gameName;

  StreamController _chessGameStreamController = StreamController<String>();
  Sink get chessGameInput => _chessGameStreamController.sink;
  Stream get gameOutput => _chessGameStreamController.stream;

  void changeNameTo(String newName) {
    this.gameName = newName;
    chessGameInput.add(this.gameName);
  }

}