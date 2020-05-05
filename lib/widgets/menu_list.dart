import 'package:chessmindexpander/models/menu_item.dart';
import 'package:chessmindexpander/pages/pieces_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_menu_item.dart';

class MenuList extends StatelessWidget {
  final List<MenuItem> menuItems;

  MenuList({this.menuItems});

  List<Widget> createItems() {
    return menuItems.map((element) =>
        MainMenuItem(
            FaIcon(
              element.iconData,
              size: 32.0,
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
        physics: this.menuItems.length >= 3
            ? NeverScrollableScrollPhysics()
            : AlwaysScrollableScrollPhysics(),
        children: createItems(),
      ),
    );
  }
}
