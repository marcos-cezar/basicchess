import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoardDetailPage extends StatelessWidget {
  static const boardPageRouteName = "/boardInfo";

  BoardDetailPage({Key key}) : super(key: key);

  final ChessBoardController _chessBoardController = ChessBoardController();

  @override
  Widget build(BuildContext context) {

    //To clean board when start screen
    _chessBoardController.clearBoard();

    return AppBaseSkeleton(
      title: AppLocalizations.of(context).board_title,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(
              AppLocalizations.of(context).board_description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 14),
            ),
            Expanded(
                child: ChessBoard(
                  enableUserMoves: false,
                  controller: _chessBoardController,
                )),
            Text(
              AppLocalizations.of(context).board_tip,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
