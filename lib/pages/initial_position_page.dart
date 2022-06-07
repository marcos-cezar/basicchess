import 'package:chessmindexpander/models/chess_entity_set.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InitialPositionPage extends StatefulWidget {
  static const initialPositionPageRouteName = "/initialPosition";

  const InitialPositionPage({Key key}) : super(key: key);

  @override
  InitialPositionPageState createState() => InitialPositionPageState();
}

class InitialPositionPageState extends State<InitialPositionPage> {
  ChessEntitySet _chessEntitySet;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_chessEntitySet == null) {
      ChessBoardController chessBoardController = ChessBoardController();
      _chessEntitySet = ChessEntitySet(
          ChessBoard(
            size: MediaQuery.of(context).size.width - 16,
            enableUserMoves: false,
            controller: chessBoardController,
          ),
          chessBoardController);
    }
  }

  @override
  Widget build(BuildContext context) {

    AppLocalizations appLocalization = AppLocalizations.of(context);
    String positionDescription = appLocalization.start_position_description;

    return AppBaseSkeleton(
      title: appLocalization.start_position_title,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _chessEntitySet.chessboard,
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Colors.blueGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(positionDescription,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
