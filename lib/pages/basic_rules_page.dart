import 'package:chessmindexpander/models/menu_item.dart';
import 'package:chessmindexpander/pages/board_detail_page.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:chessmindexpander/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'initial_position_page.dart';

class BasicRulesPage extends StatelessWidget {
  static const String PIECES_PAGE_ROUTE_NAME = "/basicRules";

  @override
  Widget build(BuildContext context) {
    String knownMore = "Clique para saber mais";
    return AppBaseSkeleton(
        title: "Regras iniciais",
        child: Column(children: <Widget>[
          MenuList(menuItems: [
            MenuItem("Tabuleiro", "Conheça o cenário onde a partida acontece. $knownMore",
                FontAwesomeIcons.chessBoard, () {
                  Navigator.pushNamed(context, BoardDetailPage.BOARD_PAGE_ROUTE_NAME);
                }),
            MenuItem("Posição inicial", "Aprenda qual a disposição inicial das peças. $knownMore",
                FontAwesomeIcons.chess, () {
                  Navigator
                      .pushNamed(context, InitialPositionPage
                      .INITIAL_POSITION_PAGE_ROUTE_NAME);
                }),

            MenuItem("Bispo", "Bispo move-se para as diagonais. $knownMore",
                FontAwesomeIcons.chessBishop, () {
                  print("clicou no bispo");
                }),

            MenuItem("Torre", "Torre move-se horizontalmente ou verticalmente. $knownMore",
                FontAwesomeIcons.chessRook, () {
                  print("clicou no torre");
                }),

            MenuItem("Dama", "A dama move-se como a torre e o bispo. $knownMore",
                FontAwesomeIcons.chessQueen, () {
                  print("clicou na dama");
                }),


            MenuItem("Rei", "O rei move-se como a dama só que apenas uma casa. $knownMore",
                FontAwesomeIcons.chessKing, () {
                  print("clicou no rei");
                }),

            MenuItem("Peão", "Peão move-se para frente. $knownMore",
                FontAwesomeIcons.chessPawn, () {
                  print("clicou no peao");
                }),

            MenuItem("Cavalo", "Cavalo move-se em formato de L. $knownMore",
                FontAwesomeIcons.chessKnight, () {
                  print("clicou no cavalo");
                }),


          ],)
        ],)
    );
  }
}
