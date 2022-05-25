import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBaseSkeleton extends StatelessWidget {

  final String title;
  final Color backgroundColor;
  final Widget child;

  const AppBaseSkeleton(
      {this.title, this.backgroundColor = Colors.white, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: Text(
          title,
          style: GoogleFonts.playfairDisplay(
              fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: child,
      ),
      backgroundColor: backgroundColor,
    );
  }
}
