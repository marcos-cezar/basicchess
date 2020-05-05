import 'package:chessmindexpander/models/menu_item.dart';
import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:chessmindexpander/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PiecesPage extends StatelessWidget {
  static const String PIECES_PAGE_ROUTE_NAME = "/pieces";

  @override
  Widget build(BuildContext context) {
    return AppBaseSkeleton(
        title: "Peças",
        child: Column(children: <Widget>[
          MenuList(menuItems: [
            MenuItem("Peão", "Peça fundamental para desenho das suas estratégias conheça mais",
                FontAwesomeIcons.chessPawn, () {
                  print("clicou no peao");
                }),
            MenuItem("Cavalo", "Peça com movimento mais difícil conheça mais",
                FontAwesomeIcons.chessKnight, () {
                  print("clicou no cavalo");
                })
          ],)
        ],)
    );
  }
}
