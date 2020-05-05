

import 'package:flutter/material.dart';

class MenuItem {

  String title;
  String subtitle;
  IconData iconData;

  Function action;

  MenuItem(this.title, this.subtitle, this.iconData, this.action);

}