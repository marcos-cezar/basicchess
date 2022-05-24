import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:chess_vectors_flutter/vector_image.dart';
import 'package:chessmindexpander/models/chess_entity_set.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class PieceDetailArguments {
  final String name;
  final String description;
  final String startSinglePiecePos;
  final PieceType pieceType;
  final VectorBase pieceIcon;

  PieceDetailArguments(
      {this.name,
      this.description,
      this.startSinglePiecePos,
      this.pieceType,
      this.pieceIcon});
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
  void didChangeDependencies() {
    if (_chessEntitySet == null) {
      ChessBoardController chessBoardController = ChessBoardController();
      _chessEntitySet = ChessEntitySet(
          ChessBoard(
            size: MediaQuery.of(context).size.width - 16,
            enableUserMoves: true,
          ),
          chessBoardController);
    }
  }

  @override
  Widget build(BuildContext context) {
    pieceDetailArguments = ModalRoute.of(context).settings.arguments;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //TODO configure start position on the board
      _chessEntitySet.chessControllers.clearBoard();
      //_chessEntitySet.chessControllers
        //  .putPiece(pieceDetailArguments.pieceType, "e4", PieceColor.White);
    });

    return AppBaseSkeleton(
      title: pieceDetailArguments.name,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            _chessEntitySet.chessboard,
            SizedBox(
              height: 10,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blueGrey)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: pieceDetailArguments.pieceIcon,
                        ),
                      ),
                      Text(
                        pieceDetailArguments.description,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
