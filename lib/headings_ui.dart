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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Description(
                            trending[index]['title'] == null
                                ? trending[index]['original_name']
                                : trending[index]['title'],
                            trending[index]['overview'] == null
                                ? 'Not Available'
                                : trending[index]['overview'],
                            'https://tmdb.org/t/p/w400/' +
                                trending[index]['backdrop_path'],
                            trending[index]['release_date'] == null
                                ? trending[index]['first_air_date']
                                : trending[index]['release_date'],
                            'https://tmdb.org/t/p/w400/' +
                                trending[index]['poster_path'],
                            trending[index]['vote_average'].toString(),
                          )),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: 200,
                        margin: const EdgeInsets.only(
                          left: 4,
                          right: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
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
