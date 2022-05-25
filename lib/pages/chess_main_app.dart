import 'package:chessmindexpander/bloc/chess_bloc.dart';
import 'package:chessmindexpander/models/chess_menu_item.dart';
import 'package:chessmindexpander/pages/basic_rules_page.dart';
import 'package:chessmindexpander/pages/openings_page.dart';
import 'package:chessmindexpander/pages/studies_page.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:chessmindexpander/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

class MainChessApp extends StatefulWidget {
  const MainChessApp({Key key}) : super(key: key);

  @override
  _MainChessAppState createState() => _MainChessAppState();
}

class _MainChessAppState extends State<MainChessApp> {
  GameInheritedWidget holder;

  @override
  Widget build(BuildContext context) {
    holder = AppStateContainer.of(context);
    return AppBaseSkeleton(
        title: "Xadrez Facilitado",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MenuList(menuItems: [
                ChessMenuItem(
                    "Regras iniciais",
                    "Aprenda o básico sobre o jogo",
                    FontAwesomeIcons.chessBoard, () {
                  Navigator.pushNamed(
                      context, BasicRulesPage.PIECES_PAGE_ROUTE_NAME);
                }),
                ChessMenuItem("Aberturas", "Memorize as aberturas mais famosas",
                    FontAwesomeIcons.bookAtlas, () {
                  Navigator.pushNamed(
                      context, OpeningsPage.OPENING_PAGE_ROUTE_NAME);
                }),
                ChessMenuItem("Estudos", "Estude uma partida ou uma posição",
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

  const GameInheritedWidget(this.appStateContainer, this.gameBloc,
      {Key key, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(GameInheritedWidget oldWidget) {
    return appStateContainer != oldWidget.appStateContainer ||
        gameBloc != oldWidget.gameBloc;
  }
}
