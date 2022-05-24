import 'package:chessmindexpander/bloc/chess_bloc.dart';
import 'package:chessmindexpander/main.dart';
import 'package:chessmindexpander/models/chess_entity_set.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

import 'opening_details_page.dart';

class OpeningsPage extends StatefulWidget {
  static const OPENING_PAGE_ROUTE_NAME = "/openings";

  @override
  _OpeningsPageState createState() => _OpeningsPageState();
}

class _OpeningsPageState extends State<OpeningsPage> {

  ChessEntitySet chessEntitySet;

  final Map<String, ChessEntitySet> openingEntries = Map<String, ChessEntitySet>();
  ChessGameBloc chessGameBloc;

  void createOpeningChessBoards() {
    chessGameBloc.chessOpenings.forEach((key, value) {
      ChessBoardController chessBoardController = ChessBoardController();
      ChessBoard currentChessBoard = ChessBoard(
          size: 120,
          enableUserMoves: false);

      openingEntries.putIfAbsent(key, () {
        return ChessEntitySet(currentChessBoard, chessBoardController);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    chessGameBloc = AppStateContainer.of(context).gameBloc;
    createOpeningChessBoards();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      openingEntries.forEach((key, value) {
        value.chessControllers
            .loadPGN(chessGameBloc.chessOpenings[key].startPgnPos);
      });
    });

    List<Widget> createOpeningItems() {
      final List<Widget> resultOpenings = [];

      openingEntries.forEach((key, value) {
        final Widget currentCardItem = SizedBox(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                  OpeningDetailsPage.OPENING_DETAIL_PAGE_ROUTE_NAME,
                  arguments: OpeningArguments.name(
                      key,
                      chessGameBloc.chessOpenings[key].startPgnPos,
                      chessGameBloc.chessOpenings[key].description));
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Hero(
                        tag: "chess_opening_$key",
                        child: value.chessboard,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Text(key)
                  ],
                ),
              ),
            ),
          ),
        );

        resultOpenings.add(currentCardItem);
      });
      return resultOpenings;
    }

    return AppBaseSkeleton(
      title: "Aberturas",
      child: ListView(
        children: createOpeningItems(),
      ),
    );
  }
}
