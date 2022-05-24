import 'package:chessmindexpander/models/chess_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_menu_item.dart';

class MenuList extends StatelessWidget {
  final List<ChessMenuItem> menuItems;

  const MenuList({this.menuItems});

  List<Widget> createItems() {
    return menuItems.map((element) =>
        MainMenuItem(
            FaIcon(
              element.iconData,
              size: 32.0,
              color: Colors.black54,
            ),
            element.title,
            element.subtitle,
            element.action)
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        physics: menuItems.length >= 3
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        children: createItems(),
      ),
    );
  }
}
