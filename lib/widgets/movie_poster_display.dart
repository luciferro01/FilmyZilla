// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../screens/description.dart';

class Display extends StatelessWidget {
  // final Image;
  // final rating;
  final trending;
  final index;
  const Display(this.trending, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   children: [
    //     Positioned(
    //       child: Container(
    //         height: MediaQuery.of(context).size.height * 0.3,
    //         width: 180,
    //         margin: const EdgeInsets.only(
    //           left: 4,
    //           right: 4,
    //         ),
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: NetworkImage(Image),
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       child: Container(
    //         margin: const EdgeInsets.all(10),
    //         padding:
    //             const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: const Color.fromARGB(91, 0, 0, 0),
    //         ),
    //         child: Text(rating),
    //       ),
    //     )
    //   ],
    // );
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => Description(
                  trending[index]['title'] ?? trending[index]['original_name'],
                  trending[index]['overview'] ?? 'Not Available',
                  'https://tmdb.org/t/p/w400/' +
                      trending[index]['backdrop_path'],
                  trending[index]['release_date'] ??
                      trending[index]['first_air_date'],
                  'https://tmdb.org/t/p/w400/' + trending[index]['poster_path'],
                  trending[index]['vote_average'].toString(),
                  'heroImage$index${trending[index]['id']}',
                )),
          ),
        );
      },
      child: Stack(
        children: [
          Positioned(
            child: Hero(
              tag: 'heroImage$index${trending[index]['id']}',
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                // height: 800,
                width: 200,
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
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding:
                  const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
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
    );
  }
}
