import 'package:chessmindexpander/bloc/chess_bloc.dart';
import 'package:chessmindexpander/main.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as developer;

// ignore: must_be_immutable
class StudiesPage extends StatefulWidget {
  static const STUDIES_PAGE_ROUTE_NAME = "/studies";

  const StudiesPage({Key key}) : super(key: key);

  @override
  _StudiesPageState createState() => _StudiesPageState();
}

class _StudiesPageState extends State<StudiesPage> {
  final ChessBoardController _chessBoardController = ChessBoardController();
  bool isToFlipBoard = true;
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
              child: _buildChessBoard(),
            ),
            const Text("PGN"),
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
                              side: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              "${snapshot.data}",
                              style: GoogleFonts.playfairDisplay(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  textStyle: const TextStyle(fontSize: 14)),
                            ),
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
                Column(
                  children: <Widget>[
                    BoardControlButton(
                      icon: const Icon(Icons.forward),
                      transformation: Transform.rotate(
                        angle: 180 * 3.14 / 180,
                        child: const Icon(Icons.forward),
                      ),
                      buttonAction: () {
                        if (gameBloc.currentTurn > -1) {
                          gameBloc.currentTurn--;
                          _chessBoardController.game.undo_move();
                          _chessBoardController
                              .loadPGN(_chessBoardController.game.pgn({}));
                        }
                      },
                    ),
                    Text(
                      "Voltar",
                      style: GoogleFonts.playfairDisplay(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          textStyle: const TextStyle(fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    BoardControlButton(
                      icon: const Icon(Icons.autorenew),
                      buttonAction: () {
                        gameBloc.currentTurn = 0;
                        gameBloc.moves.clear();
                        _chessBoardController.resetBoard();
                        gameBloc.updateCurrentGame(
                            _chessBoardController.game.pgn({}));
                      },
                    ),
                    Text(
                      "Reiniciar",
                      style: GoogleFonts.playfairDisplay(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          textStyle: const TextStyle(fontSize: 14)),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Switch(
                      value: !isToFlipBoard,
                      onChanged: (value) {
                        isToFlipBoard = !value;
                        setState(() {});
                      },
                    ),
                    Text(
                      "Virar tabuleiro",
                      style: GoogleFonts.playfairDisplay(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          textStyle: const TextStyle(fontSize: 14)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChessBoard() {
    return ChessBoard(
      controller: _chessBoardController,
      size: MediaQuery.of(context).size.width,
      onMove: () {
        //gameBloc.moves.add(_chessBoardController.);
        gameBloc.currentTurn = gameBloc.moves.length - 1;
        gameBloc.updateCurrentGame(_chessBoardController.game.pgn({}));
        developer.log(gameBloc.currentTurn.toString());
      },
      enableUserMoves: true,
    );
  }
}

class BoardControlButton extends StatelessWidget {
  const BoardControlButton(
      {Key key, this.icon, this.buttonAction, this.transformation});

  final Widget icon;
  final Widget transformation;
  final Function buttonAction;

  /*
  * padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.indigo)),
        textColor: Colors.white,
        color: Colors.indigo,*/
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.indigo)),
            textStyle: const TextStyle(color: Colors.white)),
        onPressed: buttonAction,
        child: transformation ?? icon);
  }
}
