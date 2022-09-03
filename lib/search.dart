import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'search_multi.dart';

const String apiKey = 'fb1bf72f316f1126ca9f4258076532c7';
const String accessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjFiZjcyZjMxNmYxMTI2Y2E5ZjQyNTgwNzY1MzJjNyIsInN1YiI6IjYzMGY0ZDIwY2I4MDI4MDA5NGZiMDRhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dRKPDbdlM1dRovAqCO1RdgC5RMj6VAu5Shk8UOUw_YI';

late String data;

class SearchUI extends StatelessWidget {
  var data;
  Future getDetails(String searchText) async {
    String tmdbUrl =
        'https://api.themoviedb.org/3/search/multi?api_key=$apiKey&query=$searchText';
    var response = await http.get(Uri.parse(tmdbUrl));
    data = response.body;
    var decodeData = jsonDecode(data);
    // print(response.body);
    print(decodeData);
    return decodeData;
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // getDetails();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new_rounded),
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
                    data = getDetails(textEditingController);
                  },
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
            ],
          ),
        ),
        Container(
          child: const Text(
            'Top Searches',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        //
        ListView.builder(
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return Container(
                // child: data['index']['name'],
                // child: Text(
                //   data['index']['name'],
                // ),
                );
          }),
        )
      ],
    );
  }
}
