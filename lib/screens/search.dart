// import 'package:filmyzilla/main.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/movie_poster_display.dart';

const String apiKey = 'fb1bf72f316f1126ca9f4258076532c7';
const String accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjFiZjcyZjMxNmYxMTI2Y2E5ZjQyNTgwNzY1MzJjNyIsInN1YiI6IjYzMGY0ZDIwY2I4MDI4MDA5NGZiMDRhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dRKPDbdlM1dRovAqCO1RdgC5RMj6VAu5Shk8UOUw_YI';

class SearchUI extends StatefulWidget {
  const SearchUI({Key? key}) : super(key: key);

  @override
  State<SearchUI> createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  // var searchData;
  List decodedData = [];

  Future getDetails(String searchText) async {
    String tmdbUrl =
        'https://api.themoviedb.org/3/search/multi?api_key=$apiKey&query=$searchText';
    var response = await http.get(Uri.parse(tmdbUrl));
    var data = response.body;
    var decodeData = jsonDecode(data);
    // print(response.body);
    // decodedData = decodedData[1]['results'];
    // print(decodeData);
    // print(data);
    decodedData = decodeData['results'];
    // ignore: avoid_print
    print(decodedData);
    // return decodeData;
    return decodedData;
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // getDetails();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                  cursorHeight: 30,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  onChanged: (textEditingController) {
                    setState(() {
                      getDetails(textEditingController);
                    });
                  },
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded),
              )
            ],
          ),
        ),
        const Text(
          'Top Searches',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // decodedData == null
        //     ? Container(child: Text('No data found'))
        //     : Expanded(
        //         // height: 300,
        //         // width: double.infinity,
        //         child: ListView.builder(
        //           itemCount: decodedData.length,
        //           itemBuilder: ((context, index) {
        //             return SearchMultiUI(
        //               'https://tmdb.org/t/p/w400/' +
        //                   decodedData[index]['poster_path'],
        //               decodedData[index]['vote_average'].toString(),
        //             );
        //           }),
        //         ),
        //       )
        Expanded(
          // child: HeadingUI(decodedData, 'Top Searches'),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: decodedData.length,
            itemBuilder: ((context, index) {
              //       return HeadingUI(decodedData, 'Top Searches');
              // return Display(
              //   'https://tmdb.org/t/p/w400/' +
              //       decodedData[index]['poster_path'],
              //   decodedData[index]['vote_average'].toString(),
              // );
              return Container(
                  height: 600,
                  margin: const EdgeInsets.all(2),
                  child: Display(decodedData, index));
            }),
          ),
        ),
        // )
      ],
    );
  }
}
