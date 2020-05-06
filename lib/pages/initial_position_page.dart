

import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';

class InitialPositionPage extends StatelessWidget {

  static const INITIAL_POSITION_PAGE_ROUTE_NAME = "/initialPosition";

  @override
  Widget build(BuildContext context) {
    return AppBaseSkeleton(title: "Posição inicial",
      child: Column(children: <Widget>[

      ],),
    );
  }
}
