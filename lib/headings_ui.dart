import 'package:flutter/material.dart';
import 'constants/textType.dart';

class HeadingUI extends StatelessWidget {
  const HeadingUI({
    Key? key,
    required this.trending,
    required this.heading,
  }) : super(key: key);

  final List trending;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: TextUI('$heading', Colors.amber, 24),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.02,
          ),
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: (() {}),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        margin: const EdgeInsets.only(
                          left: 4,
                          right: 4,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w400' +
                              trending[index]['poster_path'],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
