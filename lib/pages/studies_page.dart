import 'package:chessmindexpander/bloc/chess_bloc.dart';
import 'package:chessmindexpander/main.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class StudiesPage extends StatefulWidget {
  static const STUDIES_PAGE_ROUTE_NAME = "/studies";

  @override
  _StudiesPageState createState() => _StudiesPageState();
}

class _StudiesPageState extends State<StudiesPage> {

  final ChessBoardController _chessBoardController = ChessBoardController();
  ChessGameBloc gameBloc;

  @override
  Widget build(BuildContext context) {
    gameBloc = AppStateContainer.of(context).gameBloc;
    return AppBaseSkeleton(
      title: "Estudos",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              child: ChessBoard(
                size: MediaQuery.of(context).size.width,
                onMove: (move) {
                  gameBloc.moves.add(move);
                  gameBloc.currentTurn = gameBloc.moves.length - 1;
                  gameBloc
                      .updateCurrentGame(_chessBoardController.game.pgn({}));
                  print(gameBloc.currentTurn);
                },
                onDraw: () {},
                onCheckMate: (winner) {
                  print(winner);
                },
                chessBoardController: _chessBoardController,
                enableUserMoves: true,
              ),
            ),
            Text("PGN"),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                      initialData: "",
                      stream: gameBloc.gameOutput,
                      builder: (context, snapshot) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("${snapshot.data}"),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.indigo)),
                    child: Transform.rotate(
                      angle: 180 * 3.14 / 180,
                      child: Icon(Icons.forward),
                    ),
                    textColor: Colors.white,
                    color: Colors.indigo,
                    onPressed: () {
                      if (gameBloc.currentTurn > -1) {
                        gameBloc.currentTurn--;
                        _chessBoardController.game.undo_move();
                        _chessBoardController
                            .loadPGN(_chessBoardController.game.pgn({}));
                      }
                    }),
                RaisedButton(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.autorenew),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.indigo)),
                    textColor: Colors.white,
                    color: Colors.indigo,
                    onPressed: () {
                      gameBloc.currentTurn = 0;
                      gameBloc.moves.clear();
                      _chessBoardController.resetBoard();
                      gameBloc.updateCurrentGame(
                          _chessBoardController.game.pgn({}));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
