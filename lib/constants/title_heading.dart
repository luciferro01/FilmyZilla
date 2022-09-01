import 'package:flutter/material.dart';

class TitleHeading extends StatelessWidget {
  const TitleHeading(this.name, this.textStyle, {Key? key}) : super(key: key);

  final String name;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        name,
        style: textStyle,
      ),
    );
  }
}
