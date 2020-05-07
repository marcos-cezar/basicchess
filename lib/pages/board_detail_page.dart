import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoardDetailPage extends StatelessWidget {
  static const BOARD_PAGE_ROUTE_NAME = "/boardInfo";

  @override
  Widget build(BuildContext context) {
    return AppBaseSkeleton(
      title: "Tabuleiro",
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(
              "O campo de batalha se divide em um quadrado dividido em 64 casas, pintadas alternadamente entre escuras e claras. Assim como o diagrama abaixo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),
            FaIcon(
              FontAwesomeIcons.chessBoard,
              size: MediaQuery.of(context).size.width - 16,
              color: Colors.grey,
            ),
            Text(
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
