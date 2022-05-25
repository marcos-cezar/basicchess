import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuItem extends StatelessWidget {
  final FaIcon _icon;
  final String _itemLabel;
  final String _itemDescription;

  final Function _onClickCallback;

  const MainMenuItem(this._icon, this._itemLabel, this._itemDescription,
      this._onClickCallback);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              leading: SizedBox(child: _icon),
              title: Text(
                _itemLabel,
                style: GoogleFonts.playfairDisplay(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    textStyle: const TextStyle(fontSize: 14)),
              ),
              onTap: _onClickCallback,
              subtitle: Text(
                _itemDescription,
                style: GoogleFonts.playfairDisplay(
                    fontStyle: FontStyle.normal,
                    textStyle: const TextStyle(fontSize: 12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
