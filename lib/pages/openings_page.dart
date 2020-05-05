import 'package:chessmindexpander/widgets/app_base_skeleton.dart';
import 'package:flutter/material.dart';

class OpeningsPage extends StatelessWidget {
  static const OPENING_PAGE_ROUTE_NAME = "/openings";

  @override
  Widget build(BuildContext context) {
    return AppBaseSkeleton(
      title: "Aberturas",
      child: Container(),
    );
  }
}
