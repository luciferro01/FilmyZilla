// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'constants/textType.dart';
import 'description.dart';

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
          child: TextUI('$heading', Colors.white70, 24),
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
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Description(
                            trending[index]['title'] ??
                                trending[index]['original_name'],
                            trending[index]['overview'] ?? 'Not Available',
                            'https://tmdb.org/t/p/w400/' +
                                trending[index]['backdrop_path'],
                            trending[index]['release_date'] ??
                                trending[index]['first_air_date'],
                            'https://tmdb.org/t/p/w400/' +
                                trending[index]['poster_path'],
                            trending[index]['vote_average'].toString(),
                          )),
                    ),
                  );
                },
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: 180,
                          margin: const EdgeInsets.only(
                            left: 4,
                            right: 4,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(186, 30, 30, 112),
                                Color(0x00070d2d),
                              ],
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://tmdb.org/t/p/w400/' +
                                    trending[index]['poster_path'],
                                scale: 2,
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          // child: Image.network(
                          //   'https://image.tmdb.org/t/p/w400' +
                          //       trending[index]['poster_path'],
                          // ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(
                              top: 2, bottom: 2, left: 8, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(91, 0, 0, 0),
                          ),
                          child: Text(
                            trending[index]['vote_average'] % 1 == 0
                                ? '${trending[index]['vote_average'].toString()}.0'
                                : trending[index]['vote_average'].toString(),
                          ),
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
