import 'package:chessmindexpander/bloc/chess_bloc.dart';
import 'package:chessmindexpander/pages/board_detail_page.dart';
import 'package:chessmindexpander/pages/chess_main_app.dart';
import 'package:chessmindexpander/pages/basic_rules_page.dart';
import 'package:chessmindexpander/pages/initial_position_page.dart';
import 'package:chessmindexpander/pages/opening_details_page.dart';
import 'package:chessmindexpander/pages/openings_page.dart';
import 'package:chessmindexpander/pages/piece_detail_page.dart';
import 'package:chessmindexpander/pages/studies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
          primaryColorLight: Colors.lightGreen,
          primaryColorDark: Colors.lightGreen,
          fontFamily: GoogleFonts.playfairDisplay(fontStyle: FontStyle.normal)
              .fontFamily,
          primaryTextTheme: const TextTheme(headline6: TextStyle(color: Colors.white))),
      initialRoute: "/",
      routes: {
        "/": (context) => AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: const MainChessApp(),
            ),
        BasicRulesPage.piecesPageRouteName: (context) => AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: BasicRulesPage(),
            ),
        OpeningsPage.OPENING_PAGE_ROUTE_NAME: (context) => AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: OpeningsPage(),
            ),
        StudiesPage.STUDIES_PAGE_ROUTE_NAME: (context) => AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: const StudiesPage(),
            ),
        BoardDetailPage.boardPageRouteName: (context) => AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: BoardDetailPage(),
            ),
        InitialPositionPage.initialPositionPageRouteName: (context) =>
            AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: const InitialPositionPage(),
            ),
        PieceDetailPage.pieceDetailPageRouteName: (context) =>
            AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: PieceDetailPage(),
            ),
        OpeningDetailsPage.OPENING_DETAIL_PAGE_ROUTE_NAME: (context) =>
            AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: OpeningDetailsPage(),
            )
      },
    ));
  });
}

class AppStateContainer extends StatefulWidget {
  final Widget child;
  final ChessGameBloc chessBloc;

  const AppStateContainer({this.child, this.chessBloc});

  @override
  _AppContainerState createState() => _AppContainerState();

  static GameInheritedWidget of(BuildContext context) {
    return context.findAncestorWidgetOfExactType();
  }
}

class _AppContainerState extends State<AppStateContainer> {
  @override
  Widget build(BuildContext context) {
    return GameInheritedWidget(
      widget,
      widget.chessBloc,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.chessBloc.destroy();
  }
}
