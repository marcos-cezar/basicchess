import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBaseSkeleton extends StatelessWidget {

  String title;
  Widget child;

  AppBaseSkeleton({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
          style: GoogleFonts.playfairDisplay(
              fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: this.child,
      ),
    );
  }
}
