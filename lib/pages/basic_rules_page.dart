import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:chessmindexpander/models/chess_menu_item.dart';
import 'package:chessmindexpander/pages/board_detail_page.dart';
import 'package:chessmindexpander/pages/piece_detail_page.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:chessmindexpander/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'initial_position_page.dart';

class BasicRulesPage extends StatelessWidget {
  static const String piecesPageRouteName = "/basicRules";

  @override
  Widget build(BuildContext context) {
    String knownMore = AppLocalizations.of(context).click_to_know_more_label;
    return AppBaseSkeleton(
        title: AppLocalizations.of(context).initial_rules,
        child: Column(
          children: <Widget>[
            MenuList(
              menuItems: [
                ChessMenuItem(
                    AppLocalizations.of(context).board_title,
                    AppLocalizations.of(context).board_menu_description +
                        knownMore,
                    FontAwesomeIcons.chessBoard, () {
                  Navigator.pushNamed(
                      context, BoardDetailPage.boardPageRouteName);
                }),
                ChessMenuItem(
                    AppLocalizations.of(context).start_position_title,
                    AppLocalizations.of(context)
                            .start_menu_position_description +
                        knownMore,
                    FontAwesomeIcons.chess, () {
                  Navigator.pushNamed(context,
                      InitialPositionPage.initialPositionPageRouteName);
                }),
                ChessMenuItem(
                    AppLocalizations.of(context).bishop_label,
                    AppLocalizations.of(context).bishop_move_short_description +
                        knownMore,
                    FontAwesomeIcons.chessBishop, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.pieceDetailPageRouteName,
                      arguments: PieceDetailArguments(
                          name: AppLocalizations.of(context).bishop_label,
                          description: AppLocalizations.of(context)
                              .bishop_move_big_description,
                          startSinglePiecePos: "e4",
                          pieceType: BoardPieceType.Bishop,
                          pieceIcon: WhiteBishop(
                            size: 48,
                          )));
                }),
                ChessMenuItem(
                    AppLocalizations.of(context).rook_label,
                    AppLocalizations.of(context).rook_move_short_description +
                        knownMore,
                    FontAwesomeIcons.chessRook, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.pieceDetailPageRouteName,
                      arguments: PieceDetailArguments(
                          name: AppLocalizations.of(context).rook_label,
                          description: AppLocalizations.of(context)
                              .rook_move_big_description,
                          startSinglePiecePos: "e4",
                          pieceType: BoardPieceType.Rook,
                          pieceIcon: WhiteRook(
                            size: 48,
                          )));
                }),
                ChessMenuItem(
                    AppLocalizations.of(context).queen_label,
                    AppLocalizations.of(context).queen_move_short_description +
                        knownMore,
                    FontAwesomeIcons.chessQueen, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.pieceDetailPageRouteName,
                      arguments: PieceDetailArguments(
                          name: AppLocalizations.of(context).queen_label,
                          description: AppLocalizations.of(context)
                              .queen_move_big_description,
                          startSinglePiecePos: "e4",
                          pieceType: BoardPieceType.Queen,
                          pieceIcon: WhiteQueen(
                            size: 48,
                          )));
                }),
                ChessMenuItem(
                    AppLocalizations.of(context).king_label,
                    AppLocalizations.of(context).king_move_short_description +
                        knownMore,
                    FontAwesomeIcons.chessKing, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.pieceDetailPageRouteName,
                      arguments: PieceDetailArguments(
                          name: AppLocalizations.of(context).king_label,
                          description: AppLocalizations.of(context)
                              .king_move_big_description,
                          startSinglePiecePos: "e4",
                          pieceType: BoardPieceType.King,
                          pieceIcon: WhiteKing(
                            size: 48,
                          )));
                }),
                ChessMenuItem(
                    AppLocalizations.of(context).pawn_label,
                    AppLocalizations.of(context).pawn_move_short_description +
                        knownMore,
                    FontAwesomeIcons.chessPawn, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.pieceDetailPageRouteName,
                      arguments: PieceDetailArguments(
                          name: AppLocalizations.of(context).pawn_label,
                          description: AppLocalizations.of(context)
                              .pawn_move_big_description,
                          startSinglePiecePos: "e2",
                          pieceType: BoardPieceType.Pawn,
                          pieceIcon: WhitePawn(
                            size: 48,
                          )));
                }),
                ChessMenuItem(
                    AppLocalizations.of(context).knight_label,
                    AppLocalizations.of(context).knight_move_short_description +
                        knownMore,
                    FontAwesomeIcons.chessKnight, () {
                  Navigator.pushNamed(
                      context, PieceDetailPage.pieceDetailPageRouteName,
                      arguments: PieceDetailArguments(
                          name: AppLocalizations.of(context).knight_label,
                          description: AppLocalizations.of(context)
                              .knight_move_big_description,
                          startSinglePiecePos: "e4",
                          pieceType: BoardPieceType.Knight,
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
