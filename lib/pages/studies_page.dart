import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';


class StudiesPage extends StatelessWidget {
  static const STUDIES_PAGE_ROUTE_NAME = "/studies";

  ChessBoardController _chessBoardController = ChessBoardController();
  List<String> _moves = [];
  String _currentGamePgn = "";
  int _currentTurn = 0;

  @override
  Widget build(BuildContext context) {
    return AppBaseSkeleton(
      title: "Estudos",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              child: ChessBoard(
                size: MediaQuery.of(context).size.width,
                onMove: (move) {
                  _moves.add(move);
                  _currentTurn = _moves.length - 1;
                  _currentGamePgn = _chessBoardController.game.pgn({});
                  print(_currentGamePgn);
                },
                onDraw: () {},
                onCheckMate: (winner) {
                  print(winner);
                },
                chessBoardController: _chessBoardController,
                enableUserMoves: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Avançar"),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    if (_currentTurn < _moves.length - 1) {
                      _currentTurn++;
                      _chessBoardController.game.move(_moves[_currentTurn]);
                      _chessBoardController.loadPGN(_chessBoardController.game.pgn({}));
                    }
                  },
                ),
                RaisedButton(
                    child: Text("Retroceder"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      if (_currentTurn > -1) {
                        _currentTurn--;
                        _chessBoardController.game.undo_move();
                        _chessBoardController.loadPGN(_chessBoardController.game.pgn({}));
                      }

                    }),
                RaisedButton(
                    child: Text("Reiniciar"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      _currentTurn = 0;
                      _moves.clear();
                      _chessBoardController.resetBoard();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
