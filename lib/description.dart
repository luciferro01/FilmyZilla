import 'package:filmyzilla/constants/textType.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launchOn;
  Description(this.name, this.description, this.bannerUrl, this.launchOn,
      this.posterUrl, this.vote);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bannerUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: TextUI('🌟 Average Rating - $vote ', Colors.white, 18),
            )
          ],
        ),
        Container(
          // height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.all(10),
          child: TextUI(name, Colors.white, 20),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: TextUI('Released On : $launchOn', Colors.white, 16),
        ),
        Row(
          children: [
            Container(
              // height: 600,
              margin: EdgeInsets.only(left: 10, top: 10),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.2,
              // padding: const EdgeInsets.only(left: 10, top: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(posterUrl),
                ),
              ),
              // child: Image.network(posterUrl),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: TextUI(description, Colors.white, 15),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
