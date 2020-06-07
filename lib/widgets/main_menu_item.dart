import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuItem extends StatelessWidget {
  final FaIcon _icon;
  final String _itemLabel;
  final String _itemDescription;

  final Function _onClickCallback;

  MainMenuItem(this._icon, this._itemLabel, this._itemDescription,
      this._onClickCallback);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Container(
                child: SizedBox(child: _icon),
              ),
              title: Text(
                _itemLabel,
                style: GoogleFonts.playfairDisplay(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyle(fontSize: 14)),
              ),
              onTap: _onClickCallback,
              subtitle: Text(
                _itemDescription,
                style: GoogleFonts.playfairDisplay(
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(fontSize: 12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
