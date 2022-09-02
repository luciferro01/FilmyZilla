import 'package:filmyzilla/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';

class primaryUI extends StatefulWidget {
  @override
  State<primaryUI> createState() => _primaryUIState();
}

const String apiKey = 'fb1bf72f316f1126ca9f4258076532c7';
const String accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjFiZjcyZjMxNmYxMTI2Y2E5ZjQyNTgwNzY1MzJjNyIsInN1YiI6IjYzMGY0ZDIwY2I4MDI4MDA5NGZiMDRhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dRKPDbdlM1dRovAqCO1RdgC5RMj6VAu5Shk8UOUw_YI';

class _primaryUIState extends State<primaryUI> {
  List trendingMovies = [];
  List trendingTVShows = [];
  List topRatedMovies = [];
  List recommendedMovies = [];
  List bollywoodMovies = [];
  List upcomingMovies = [];

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

    Map trendingTVShowsList = await tmdbCustomLogs.v3.tv.getPopular();

    Map topRatedMoviesList = await tmdbCustomLogs.v3.movies
        .getTopRated(language: 'en', region: 'in');

    // Map recommendedMoviesList = await tmdbCustomLogs.v3.movies.getLatest();
    Map recommendedMoviesList = await tmdbCustomLogs.v3.discover.getMovies();
    Map bollywoodMoviesList = await tmdbCustomLogs.v3.discover.getMovies(
      withOrginalLanguage: 'hi',
      includeVideo: true,
      sortBy: SortMoviesBy.popularityDesc,
    );
    Map upcomingMoviesList = await tmdbCustomLogs.v3.movies.getUpcoming(
      region: 'in',
      language: 'en',
    );

    setState(() {
      trendingMovies = trendingMoviesList['results'];
      trendingTVShows = trendingTVShowsList['results'];
      topRatedMovies = topRatedMoviesList['results'];
      recommendedMovies = recommendedMoviesList['results'];
      bollywoodMovies = bollywoodMoviesList['results'];
      upcomingMovies = upcomingMoviesList['results'];
    });

    // print(trendingMovies);
    // print(trendingTVShows);
    // print(topRatedMovies);
    // print(recommendedMovies);
    // print(recommendedMoviesList);
    // print(bollywoodMovies);
    print(upcomingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Hi, MOHIL!',
          style: GoogleFonts.acme(fontSize: 28),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 30),
            child: Image.asset('assets/Mohil_Bansal.png'),
          )
        ],
      ),
      body: HomePageUI(trendingMovies, trendingTVShows, topRatedMovies,
          recommendedMovies, bollywoodMovies, upcomingMovies),
    );
  }
}
