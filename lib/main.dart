import 'package:chessmindexpander/bloc/chess_bloc.dart';
import 'package:chessmindexpander/pages/chess_main_app.dart';
import 'package:chessmindexpander/pages/basic_rules_page.dart';
import 'package:chessmindexpander/pages/openings_page.dart';
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
          primaryColor: Colors.green[400],
          primaryColorLight: Colors.lightGreen[300],
          primaryColorDark: Colors.green[600],
          fontFamily: GoogleFonts.playfairDisplay(fontStyle: FontStyle.normal)
              .fontFamily,
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))),
      initialRoute: "/",
      routes: {
        "/": (context) => AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: MainChessApp(),
            ),
        BasicRulesPage.PIECES_PAGE_ROUTE_NAME : (context) => AppStateContainer(
              chessBloc: ChessGameBloc(),
              child: BasicRulesPage(),
            ),
        OpeningsPage.OPENING_PAGE_ROUTE_NAME : (context) => AppStateContainer(
          chessBloc: ChessGameBloc(),
          child: OpeningsPage(),
        ),
        StudiesPage.STUDIES_PAGE_ROUTE_NAME : (context) => AppStateContainer(
          chessBloc: ChessGameBloc(),
          child: StudiesPage(),
        )
      },
    ));
  });
}

class AppStateContainer extends StatefulWidget {
  final Widget child;
  final ChessGameBloc chessBloc;

  AppStateContainer({this.child, this.chessBloc});

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
      this.widget,
      this.widget.chessBloc,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    this.widget.chessBloc.destroy();
  }


}
