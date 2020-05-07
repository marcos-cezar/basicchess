import 'package:chessmindexpander/models/chess_entity_set.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class PieceDetailArguments {
  final String name;
  final String description;
  final String startSinglePiecePos;
  final PieceType pieceType;

  PieceDetailArguments(
      {this.name, this.description, this.startSinglePiecePos, this.pieceType});
}

class PieceDetailPage extends StatefulWidget {
  static const PIECE_DETAIL_PAGE_ROUTE_NAME = "/pieceDetails";

  @override
  _PieceDetailPageState createState() => _PieceDetailPageState();
}

class _PieceDetailPageState extends State<PieceDetailPage> {
  PieceDetailArguments pieceDetailArguments;
  ChessEntitySet _chessEntitySet;

  @override
  Widget build(BuildContext context) {
    pieceDetailArguments = ModalRoute.of(context).settings.arguments;

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
      _chessEntitySet.chessControllers.clearBoard();
      _chessEntitySet.chessControllers
          .putPiece(pieceDetailArguments.pieceType, "e4", PieceColor.White);
    });

    return AppBaseSkeleton(
      title: pieceDetailArguments.name,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Text(
              pieceDetailArguments.description,
              textAlign: TextAlign.justify,
            ),
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
