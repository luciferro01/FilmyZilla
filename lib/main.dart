import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'ui.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

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
  List recommendedMovies = [];

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
    // Map trendingTVShowsList =
    //     await tmdbCustomLogs.v3.tv.getPopular(language: 'hi');

    Map trendingTVShowsList = await tmdbCustomLogs.v3.tv.getPopular();

    Map topRatedMoviesList = await tmdbCustomLogs.v3.movies
        .getTopRated(language: 'en', region: 'in');

    // Map recommendedMoviesList = await tmdbCustomLogs.v3.movies.getLatest();
    Map recommendedMoviesList = await tmdbCustomLogs.v3.discover.getMovies();

    setState(() {
      trendingMovies = trendingMoviesList['results'];
      trendingTVShows = trendingTVShowsList['results'];
      topRatedMovies = topRatedMoviesList['results'];
      recommendedMovies = recommendedMoviesList['results'];
    });

    // print(trendingMovies);
    print(trendingTVShows);
    print(topRatedMovies);
    print(recommendedMovies);
    print(recommendedMoviesList);
  }

  var _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(108, 26, 26, 90),
            // Color(0x00070d2d),
            Color(0x00252443),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
        body: HomePageUI(
          trendingMovies,
          trendingTVShows,
          topRatedMovies,
          recommendedMovies,
        ),
        // bottomNavigationBar: AnimatedBottomNavigationBar(
        //   icons: const [
        //     FontAwesomeIcons.house,
        //     FontAwesomeIcons.magnifyingGlass,
        //     FontAwesomeIcons.glasses,
        //     Icons.account_circle,
        //   ],
        //   activeColor: Colors.amber,
        //   activeIndex: _bottomNavIndex,

        //   notchSmoothness: NotchSmoothness.softEdge,
        //   onTap: (index) => setState(() => _bottomNavIndex = index),
        // ),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _bottomNavIndex,
            backgroundColor: const Color(0x00252443),
            animationDuration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCirc,
            containerHeight: 70,
            showElevation: true,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            items: [
              BottomNavyBarItem(
                  icon: const FaIcon(FontAwesomeIcons.house),
                  title: const Text('    Home'),
                  activeColor: Colors.amber,
                  inactiveColor: Colors.grey),
              BottomNavyBarItem(
                  icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                  title: const Text('    Search '),
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey),
              BottomNavyBarItem(
                  icon: const FaIcon(FontAwesomeIcons.ticket),
                  title: const Text('     Coming Soon'),
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey),
              BottomNavyBarItem(
                  icon: const FaIcon(FontAwesomeIcons.userAstronaut),
                  title: const Text('    Account'),
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey),
            ],
            onItemSelected: (index) => setState(() {
                  _bottomNavIndex = index;
                })),
      ),
    );
  }
}
