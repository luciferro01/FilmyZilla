import 'package:flutter/material.dart';
import 'constants/textType.dart';
import 'headings_ui.dart';

class HomePageUI extends StatelessWidget {
  final List trendingMovies;
  final List trendingTV;
  final List topRatedMovies;
  HomePageUI(this.trendingMovies, this.trendingTV, this.topRatedMovies);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeadingUI(trending: trendingMovies, heading: 'Trending Movies'),
        HeadingUI(trending: trendingTV, heading: 'Trending TV Shows'),
        HeadingUI(trending: topRatedMovies, heading: 'Top Rated Movies'),
      ],
    );
  }
}
