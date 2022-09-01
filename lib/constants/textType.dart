import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUI extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const TextUI(this.text, this.color, this.fontSize, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        decoration: TextDecoration.none,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
