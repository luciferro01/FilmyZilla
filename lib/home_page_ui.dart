import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'widgets/headings_ui.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({Key? key}) : super(key: key);

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

const String apiKey = 'fb1bf72f316f1126ca9f4258076532c7';
const String accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjFiZjcyZjMxNmYxMTI2Y2E5ZjQyNTgwNzY1MzJjNyIsInN1YiI6IjYzMGY0ZDIwY2I4MDI4MDA5NGZiMDRhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dRKPDbdlM1dRovAqCO1RdgC5RMj6VAu5Shk8UOUw_YI';

class _HomePageUIState extends State<HomePageUI> {
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
    // Map upcomingMoviesList = await tmdbCustomLogs.v3.discover.getMovies(
    //   withOrginalLanguage: 'hi',
    //   language: 'en',
    //   region: 'in',
    //   primaryReleaseDateGreaterThan: DateTime(2022).toString(),
    // );

    if (mounted) {
      setState(() {
        trendingMovies = trendingMoviesList['results'];
        trendingTVShows = trendingTVShowsList['results'];
        topRatedMovies = topRatedMoviesList['results'];
        recommendedMovies = recommendedMoviesList['results'];
        bollywoodMovies = bollywoodMoviesList['results'];
        upcomingMovies = upcomingMoviesList['results'];
      });
    }
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
      body: ListView(
        children: [
          HeadingUI(recommendedMovies, 'Recommendations'),
          HeadingUI(trendingMovies, 'Trending Movies'),
          HeadingUI(trendingTVShows, 'Trending TV Shows'),
          HeadingUI(topRatedMovies, 'Top Rated Movies'),
          // HeadingUI(topRatedMovies, 'Top Rated Movies'),
          HeadingUI(bollywoodMovies, 'Bollywood Movies'),
          HeadingUI(upcomingMovies, 'Upcoming  Movies'),
        ],
      ),
    );
  }
}
