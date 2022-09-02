import 'package:filmyzilla/primaryUI.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'ui.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'coming_soon.dart';
import 'account.dart';
import 'search.dart';

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

class FilmyZilla extends StatefulWidget {
  @override
  State<FilmyZilla> createState() => _FilmyZillaState();
}

class _FilmyZillaState extends State<FilmyZilla> {
  List bodyList = [
    primaryUI(),
    SearchUI(),
    ComingSoon(),
    AccountUI(),
  ];

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
        body: bodyList[_bottomNavIndex],
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
          onItemSelected: (index) => setState(
            () {
              _bottomNavIndex = index;
            },
          ),
        ),
      ),
    );
  }
}
