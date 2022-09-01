import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClipContainer extends StatelessWidget {
  final String text;
  const ClipContainer(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black26,
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color.fromARGB(239, 72, 140, 208),
        ),
      ),
    );
  }
}
