import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'headings_ui.dart';

class HomePageUI extends StatelessWidget {
  final List trendingMovies;
  final List trendingTV;
  final List topRatedMovies;
  final List recommendedMovies;

  const HomePageUI(this.trendingMovies, this.trendingTV, this.topRatedMovies,
      this.recommendedMovies,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClipPath(
          // clipBehavior: Clip.antiAlias,
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: 400,
            // child: Image.network('https://tmdb.org/t/p/w400/' +
            // recommendedMovies[1]['poster_path']),
          ),
        ),
        HeadingUI(trending: recommendedMovies, heading: 'Recommendations'),
        HeadingUI(trending: trendingMovies, heading: 'Trending Movies'),
        HeadingUI(trending: trendingTV, heading: 'Trending TV Shows'),
        HeadingUI(trending: topRatedMovies, heading: 'Top Rated Movies'),
      ],
    );
  }
}
