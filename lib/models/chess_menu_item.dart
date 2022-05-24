
import 'package:flutter/material.dart';

class ChessMenuItem {

  String title;
  String subtitle;
  IconData iconData;

  Function action;

  ChessMenuItem(this.title, this.subtitle, this.iconData, this.action);

}