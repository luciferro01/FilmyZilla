import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(),
      home: FilmyZilla(),
    );
  }
}

const String apiKey = 'fb1bf72f316f1126ca9f4258076532c7';
const String accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjFiZjcyZjMxNmYxMTI2Y2E5ZjQyNTgwNzY1MzJjNyIsInN1YiI6IjYzMGY0ZDIwY2I4MDI4MDA5NGZiMDRhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dRKPDbdlM1dRovAqCO1RdgC5RMj6VAu5Shk8UOUw_YI';

class FilmyZilla extends StatefulWidget {
  @override
  State<FilmyZilla> createState() => _FilmyZillaState();
}

class _FilmyZillaState extends State<FilmyZilla> {
  List trendingMovies = [];
  List trendingTVShows = [];
  List topRatedMovies = [];

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  void loadMovies() async {
    TMDB tmdbCustomLogs = TMDB(
      ApiKeys(apiKey, accessToken),
      logConfig: const ConfigLogger(
        showErrorLogs: true,
        showLogs: true,
      ),
    );
    Map trendingMoviesList = await tmdbCustomLogs.v3.trending
        .getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.day);
    // print(trendingMoviesList);
    Map trendingTVShowsList = await tmdbCustomLogs.v3.tv.getPopular();

    Map topRatedMoviesList = await tmdbCustomLogs.v3.movies
        .getTopRated(language: 'hi', region: 'in');

    setState(() {
      trendingMovies = trendingMoviesList['results'];
      trendingTVShows = trendingTVShowsList['results'];
      topRatedMovies = topRatedMoviesList['results'];
    });

    print(trendingMovies);
    print(trendingTVShows);
    print(topRatedMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filmyzilla',
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          //   fontStyle: FontStyle.italic,
          //   fontFamily: GoogleFonts.acme(),
          // ),
          style: GoogleFonts.acme(),
        ),
        centerTitle: true,
      ),
      body: HomePageUI(trendingMovies, trendingTVShows, topRatedMovies),
    );
  }
}
