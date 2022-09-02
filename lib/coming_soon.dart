import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Coming Soon',
            style: GoogleFonts.poppins(),
          ),
        ),
      ),
    );
  }
}
