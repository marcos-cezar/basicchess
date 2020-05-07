import 'package:chessmindexpander/models/chess_entity_set.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class OpeningArguments {
  String name;
  String startPgnPos;
  String description;

  OpeningArguments.name(this.name, this.startPgnPos, this.description);
}

class OpeningDetailsPage extends StatefulWidget {

  static const OPENING_DETAIL_PAGE_ROUTE_NAME = "/openingDetails";

  @override
  _OpeningDetailsPageState createState() => _OpeningDetailsPageState();
}

class _OpeningDetailsPageState extends State<OpeningDetailsPage> {

  OpeningArguments _openingArguments;
  ChessEntitySet _chessEntitySet;

  @override
  Widget build(BuildContext context) {
    _openingArguments = ModalRoute.of(context).settings.arguments;

    if (_chessEntitySet == null) {
      ChessBoardController chessBoardController = ChessBoardController();
      _chessEntitySet = ChessEntitySet(
          ChessBoard(
            size: MediaQuery.of(context).size.width - 16,
            onMove: (move) {},
            onCheckMate: (winnerColor) {},
            onDraw: () {},
            chessBoardController: chessBoardController,
            enableUserMoves: true,
          ),
          chessBoardController);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //TODO configure start position on the board
      _chessEntitySet.chessControllers
          .loadPGN(_openingArguments.startPgnPos);
    });

    return AppBaseSkeleton(
      title: _openingArguments.name,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Text(_openingArguments.description),
            SizedBox(
              height: 10,
            ),
            _chessEntitySet.chessboard
          ],
        ),
      ),
    );
  }
}
