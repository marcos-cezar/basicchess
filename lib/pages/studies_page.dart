import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class StudiesPage extends StatelessWidget {
  static const STUDIES_PAGE_ROUTE_NAME = "/studies";

  ChessBoardController chessBoardController = ChessBoardController();
  List<String> moves = [];
  String currentGamePgn = "";
  int currentTurn = 0;

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
                  moves.add(move);
                  currentTurn = moves.length - 1;
                  currentGamePgn = chessBoardController.game.pgn({});
                  print(currentGamePgn);
                },
                onDraw: () {},
                onCheckMate: (winner) {
                  print(winner);
                },
                chessBoardController: chessBoardController,
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
                    if (currentTurn < moves.length - 1) {
                      currentTurn++;
                      chessBoardController.game.move(moves[currentTurn]);
                      chessBoardController.loadPGN(chessBoardController.game.pgn({}));
                    }
                  },
                ),
                RaisedButton(
                    child: Text("Retroceder"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      if (currentTurn > -1) {
                        currentTurn--;
                        chessBoardController.game.undo_move();
                        chessBoardController.loadPGN(chessBoardController.game.pgn({}));
                      }

                    }),
                RaisedButton(
                    child: Text("Reiniciar"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      currentTurn = 0;
                      moves.clear();
                      chessBoardController.resetBoard();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
