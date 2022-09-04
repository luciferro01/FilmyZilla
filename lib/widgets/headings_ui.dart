import 'package:filmyzilla/widgets/movie_poster_display.dart';
import 'package:flutter/material.dart';
import 'textType.dart';

class HeadingUI extends StatelessWidget {
  const HeadingUI(this.trending, this.heading, {Key? key}) : super(key: key);

  final List trending;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: TextUI(heading, Colors.white70, 24),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.02,
          ),
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: ((context, index) {
              return Display(trending, index);
            }),
          ),
        )
      ],
    );
  }
}
