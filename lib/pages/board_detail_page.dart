import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoardDetailPage extends StatelessWidget {
  static const boardPageRouteName = "/boardInfo";

  BoardDetailPage({Key key}) : super(key: key);

  final ChessBoardController _chessBoardController = ChessBoardController();

  @override
  Widget build(BuildContext context) {

    //To clean board when start screen
    _chessBoardController.clearBoard();

    return AppBaseSkeleton(
      title: "Tabuleiro",
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            const Text(
              "O campo de batalha se divide em um quadrado dividido em 64 casas, pintadas alternadamente entre escuras e claras. Assim como o diagrama abaixo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),
            Expanded(
                child: ChessBoard(
                  enableUserMoves: false,
                  controller: _chessBoardController,
                )),
            const Text(
              "A posição correta do tabuleiro é aquela onde os jogadores tenham a sua direita o último quadrado branco.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
