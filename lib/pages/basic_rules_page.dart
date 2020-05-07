import 'package:chessmindexpander/models/menu_item.dart';
import 'package:chessmindexpander/pages/board_detail_page.dart';
import 'package:chessmindexpander/pages/piece_detail_page.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:chessmindexpander/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
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
                  Navigator.pushNamed(context,
                      PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(name: "Bispo",
                          description: "Bispo peça que anda nas diagonais do tabuleiro.",
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.Bishop));
                }),

            MenuItem("Torre", "Torre move-se horizontalmente ou verticalmente. $knownMore",
                FontAwesomeIcons.chessRook, () {
                  Navigator.pushNamed(context,
                      PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(name: "Torre",
                          description: "Torre se movimenta na horizontal e vertical.",
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.Rook));
                }),

            MenuItem("Dama", "A dama move-se como a torre e o bispo. $knownMore",
                FontAwesomeIcons.chessQueen, () {
                  Navigator.pushNamed(context,
                      PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(name: "Dama",
                          description: "O movimento da Dama é a junção do movimento da torre e do bispo.",
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.Queen));
                }),


            MenuItem("Rei", "O rei move-se como a dama só que apenas uma casa. $knownMore",
                FontAwesomeIcons.chessKing, () {
                  Navigator.pushNamed(context,
                      PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(name: "Rei",
                          description: "Rei possui o movimento igual ao da Dama porém somente podendo andar uma casa. O Rei é a peça mais importante e pode levar cheque mate.",
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.King));
                }),

            MenuItem("Peão", "Peão move-se para frente. $knownMore",
                FontAwesomeIcons.chessPawn, () {
                  Navigator.pushNamed(context,
                      PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(name: "Peão",
                          description: "Peão se move somente para frente e pode ser promovido ao chegar ao extremo do tabuleiro. No primeiro movimento pode andar duas casa.",
                          startSinglePiecePos: "e2",
                          pieceType: PieceType.Pawn));
                }),

            MenuItem("Cavalo", "Cavalo move-se em formato de L. $knownMore",
                FontAwesomeIcons.chessKnight, () {
                  Navigator.pushNamed(context,
                      PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(name: "Cavalo",
                          description: "Cavalo se movimenta em formato de L.",
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.Knight));
                }),


          ],)
        ],)
    );
  }
}
