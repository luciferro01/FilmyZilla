import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  final String text;
  SubHeading(this.text);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(text),
    );
  }
}
