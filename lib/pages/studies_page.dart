import 'package:chessmindexpander/bloc/chess_bloc.dart';
import 'package:chessmindexpander/main.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as developer;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class StudiesPage extends StatefulWidget {
  static const STUDIES_PAGE_ROUTE_NAME = "/studies";

  const StudiesPage({Key key}) : super(key: key);

  @override
  _StudiesPageState createState() => _StudiesPageState();
}

class _StudiesPageState extends State<StudiesPage> {

  final ChessBoardController _chessBoardController = ChessBoardController();
  bool isToFlipBoard = false;
  ChessGameBloc gameBloc;

  Uri chessMoveSoundFile;

  void startAudioPool() async {
    chessMoveSoundFile = await FlameAudio.audioCache.load("chess_move_wood_sound.mp3");
  }

  @override
  Widget build(BuildContext context) {
    gameBloc = AppStateContainer.of(context).gameBloc;
    startAudioPool();
    return AppBaseSkeleton(
      title: AppLocalizations.of(context).studies_title,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              child: _buildChessBoard(_chessBoardController, isToFlipBoard),
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
                            child: ValueListenableBuilder<Chess>(
                              valueListenable: _chessBoardController,
                              builder: (context, game, _) {
                                return Text(
                                  "${game.san_moves()}",
                                  style: GoogleFonts.playfairDisplay(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      textStyle: const TextStyle(fontSize: 14)),
                                );
                              },
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
                      icon: const Icon(Icons.forward, color: Colors.white),
                      transformation: Transform.rotate(
                        angle: 180 * 3.14 / 180,
                        child: const Icon(
                          Icons.forward,
                          color: Colors.white,
                        ),
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
                      AppLocalizations.of(context).back_button_label,
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
                      icon: const Icon(
                        Icons.autorenew,
                        color: Colors.white,
                      ),
                      buttonAction: () {
                        gameBloc.currentTurn = 0;
                        gameBloc.moves.clear();
                        _chessBoardController.resetBoard();
                        gameBloc.updateCurrentGame(
                            _chessBoardController.game.pgn({}));
                      },
                    ),
                    Text(
                      AppLocalizations.of(context).restart_button_label,
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
                      value: isToFlipBoard,
                      onChanged: (value) {
                        setState(() {
                          isToFlipBoard = value;
                        });
                      },
                    ),
                    Text(
                      AppLocalizations.of(context).flip_board_label,
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

  Widget _buildChessBoard(
      ChessBoardController chessBoardController, bool flippedBoard) {
    return ChessBoard(
      controller: chessBoardController,
      onMove: () {
        gameBloc.moves.add(_chessBoardController.getSan().last);
        gameBloc.currentTurn = gameBloc.moves.length - 1;
        gameBloc.updateCurrentGame(_chessBoardController.game.pgn({}));
        developer.log(gameBloc.currentTurn.toString());
        FlameAudio.play("chess_move_wood_sound.ogg");
      },
      boardOrientation: flippedBoard ? PlayerColor.black : PlayerColor.white,
      enableUserMoves: true,
    );
  }

  @override
  void dispose() {
    FlameAudio.audioCache.clear(chessMoveSoundFile);
  }
}

class BoardControlButton extends StatelessWidget {
  const BoardControlButton(
      {Key key, this.icon, this.buttonAction, this.transformation})
      : super(key: key);

  final Widget icon;
  final Widget transformation;
  final Function buttonAction;

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
