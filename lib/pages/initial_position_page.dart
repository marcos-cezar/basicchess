import 'package:chessmindexpander/models/chess_entity_set.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class InitialPositionPage extends StatefulWidget {
  static const INITIAL_POSITION_PAGE_ROUTE_NAME = "/initialPosition";

  @override
  _InitialPositionPageState createState() => _InitialPositionPageState();
}

class _InitialPositionPageState extends State<InitialPositionPage> {
  ChessEntitySet _chessEntitySet;


  @override
  void didChangeDependencies() {
    if (_chessEntitySet == null) {
      ChessBoardController chessBoardController = ChessBoardController();
      _chessEntitySet = ChessEntitySet(
          ChessBoard(
            size: MediaQuery.of(context).size.width - 16,
            onMove: (move) {},
            onCheckMate: (winnerColor) {},
            onDraw: () {},
            chessBoardController: chessBoardController,
            enableUserMoves: false,
          ),
          chessBoardController);
    }
  }

  @override
  Widget build(BuildContext context) {

    return AppBaseSkeleton(
      title: "Posição inicial",
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[

            _chessEntitySet.chessboard,
            SizedBox(height: 20,),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.blueGrey)),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Ao se iniciar uma partida as peças devem ocupar a posição abaixo. As 16 peças ocupam de cada lado as primeiras linhas horizontais de cada lado. Os peões ocupam a segunda horizontal, as torres nos cantos, os cavalos junto às torres e os Bispos juntos aos cavalos. A dama branca ocupa a casa branca, a dama preta a casa preta. Os reis situam-se ao lado das respectivas damas.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
