import 'package:chessmindexpander/bloc/chess_bloc.dart';
import 'package:chessmindexpander/models/menu_item.dart';
import 'package:chessmindexpander/pages/basic_rules_page.dart';
import 'package:chessmindexpander/pages/openings_page.dart';
import 'package:chessmindexpander/pages/studies_page.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:chessmindexpander/widgets/main_menu_item.dart';
import 'package:chessmindexpander/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class MainChessApp extends StatefulWidget {
  @override
  _MainChessAppState createState() => _MainChessAppState();
}

class _MainChessAppState extends State<MainChessApp> {
  GameInheritedWidget holder;

  @override
  Widget build(BuildContext context) {
    holder = AppStateContainer.of(context);
    return AppBaseSkeleton(
        title: "Chess mind expander",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MenuList(menuItems: [
                MenuItem("Regras iniciais", "Aprenda o básico sobre o jogo",
                    FontAwesomeIcons.chessBoard, () {
                  Navigator.pushNamed(
                      context, BasicRulesPage.PIECES_PAGE_ROUTE_NAME);
                }),
                MenuItem("Aberturas", "Memorize as aberturas mais famosas",
                    FontAwesomeIcons.bookReader, () {
                  Navigator.pushNamed(
                      context, OpeningsPage.OPENING_PAGE_ROUTE_NAME);
                }),
                MenuItem("Estudos", "Estude uma partida ou uma posição",
                    FontAwesomeIcons.brain, () {
                  Navigator.pushNamed(
                      context, StudiesPage.STUDIES_PAGE_ROUTE_NAME);
                })
              ])
            ],
          ),
        ));
  }
}

class GameInheritedWidget extends InheritedWidget {
  final AppStateContainer appStateContainer;
  final ChessGameBloc gameBloc;

  GameInheritedWidget(this.appStateContainer, this.gameBloc,
      {Key key, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(GameInheritedWidget oldWidget) {
    return appStateContainer != oldWidget.appStateContainer ||
        gameBloc != oldWidget.gameBloc;
  }
}
