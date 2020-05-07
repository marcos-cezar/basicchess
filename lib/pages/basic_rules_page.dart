import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:chessmindexpander/models/menu_item.dart';
import 'package:chessmindexpander/pages/board_detail_page.dart';
import 'package:chessmindexpander/pages/piece_detail_page.dart';
import 'package:chessmindexpander/utils/chess_descriptions.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:chessmindexpander/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'initial_position_page.dart';

class BasicRulesPage extends StatelessWidget {
  static const String PIECES_PAGE_ROUTE_NAME = "/basicRules";

  ChessDescriptions chessDescriptions = ChessDescriptions();

  @override
  Widget build(BuildContext context) {
    String knownMore = "Clique para saber mais";
    return AppBaseSkeleton(
        title: "Regras iniciais",
        child: Column(
          children: <Widget>[
            MenuList(
              menuItems: [
                MenuItem(
                    "Tabuleiro",
                    "Conheça o cenário onde a partida acontece. $knownMore",
                    FontAwesomeIcons.chessBoard, () {
                  Navigator.pushNamed(
                      context, BoardDetailPage.BOARD_PAGE_ROUTE_NAME);
                }),
                MenuItem(
                    "Posição inicial",
                    "Aprenda qual a disposição inicial das peças. $knownMore",
                    FontAwesomeIcons.chess, () {
                  Navigator.pushNamed(context,
                      InitialPositionPage.INITIAL_POSITION_PAGE_ROUTE_NAME);
                }),
                MenuItem("Bispo", "Bispo move-se para as diagonais. $knownMore",
                    FontAwesomeIcons.chessBishop, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(
                          name: "Bispo",
                          description: chessDescriptions
                              .pieceDescriptions[PieceType.Bishop.toString()],
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.Bishop,
                          pieceIcon: WhiteBishop(
                            size: 48,
                          )));
                }),
                MenuItem(
                    "Torre",
                    "Torre move-se horizontalmente ou verticalmente. $knownMore",
                    FontAwesomeIcons.chessRook, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(
                          name: "Torre",
                          description: chessDescriptions
                              .pieceDescriptions[PieceType.Rook.toString()],
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.Rook,
                          pieceIcon: WhiteRook(
                            size: 48,
                          )));
                }),
                MenuItem(
                    "Dama",
                    "A dama move-se como a torre e o bispo. $knownMore",
                    FontAwesomeIcons.chessQueen, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(
                          name: "Dama",
                          description: chessDescriptions
                              .pieceDescriptions[PieceType.Queen.toString()],
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.Queen,
                          pieceIcon: WhiteQueen(
                            size: 48,
                          )));
                }),
                MenuItem(
                    "Rei",
                    "O rei move-se como a dama só que apenas uma casa. $knownMore",
                    FontAwesomeIcons.chessKing, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(
                          name: "Rei",
                          description: chessDescriptions
                              .pieceDescriptions[PieceType.King.toString()],
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.King,
                          pieceIcon: WhiteKing(
                            size: 48,
                          )));
                }),
                MenuItem("Peão", "Peão move-se para frente. $knownMore",
                    FontAwesomeIcons.chessPawn, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(
                          name: "Peão",
                          description: chessDescriptions
                              .pieceDescriptions[PieceType.Pawn.toString()],
                          startSinglePiecePos: "e2",
                          pieceType: PieceType.Pawn,
                          pieceIcon: WhitePawn(
                            size: 48,
                          )));
                }),
                MenuItem("Cavalo", "Cavalo move-se em formato de L. $knownMore",
                    FontAwesomeIcons.chessKnight, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.PIECE_DETAIL_PAGE_ROUTE_NAME,
                      arguments: PieceDetailArguments(
                          name: "Cavalo",
                          description: chessDescriptions
                              .pieceDescriptions[PieceType.Knight.toString()],
                          startSinglePiecePos: "e4",
                          pieceType: PieceType.Knight,
                          pieceIcon: WhiteKnight(
                            size: 48,
                          )));
                }),
              ],
            )
          ],
        ));
  }
}
