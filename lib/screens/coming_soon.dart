import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'fb1bf72f316f1126ca9f4258076532c7';
const String accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjFiZjcyZjMxNmYxMTI2Y2E5ZjQyNTgwNzY1MzJjNyIsInN1YiI6IjYzMGY0ZDIwY2I4MDI4MDA5NGZiMDRhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dRKPDbdlM1dRovAqCO1RdgC5RMj6VAu5Shk8UOUw_YI';
const String tmdbUrl =
    'https://api.themoviedb.org/3/search/multi?api_key=$apiKey&query=Game+of+thrones';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  Future getDetails() async {
    var response = await http.get(Uri.parse(tmdbUrl));
    String data = response.body;
    var decodeData = jsonDecode(data);
    // print(response.body);
    print(decodeData);
    // print(decodeData['genres'][0]['name']);
    // return decodeData;
    // Response response = await http.get(tmdb_api_url);
    // const data = await response.json();
    // const { name, first_air_date, vote_average, number_of_seasons, episode_run_time, genres, overview, origin_country} = data;

    // document.getElementById('genres').textContent = genres[i].name;
  }

  @override
  Widget build(BuildContext context) {
    getDetails();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Coming Soon',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: ListView(
          children: [Container()],
        ),
      ),
    );
  }
}



// const tmdb_api_url = "https://api.themoviedb.org/3/tv/" + 127332 + "?api_key=API-KEY";


// getDetails();
