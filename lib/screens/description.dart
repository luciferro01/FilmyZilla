// import 'package:filmyzilla/constants/textType.dart';
// import 'package:flutter/material.dart';

// class Description extends StatelessWidget {
//   final String name, description, bannerUrl, posterUrl, vote, launchOn;
//   Description(this.name, this.description, this.bannerUrl, this.launchOn,
//       this.posterUrl, this.vote);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Stack(
//           children: [
//             Positioned(
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(bannerUrl),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 10,
//               left: 10,
//               child: TextUI('🌟 Average Rating - $vote ', Colors.white, 18),
//             )
//           ],
//         ),
//         Container(
//           // height: MediaQuery.of(context).size.height * 0.4,
//           padding: const EdgeInsets.all(10),
//           child: TextUI(name, Colors.white, 20),
//         ),
//         Container(
//           padding: const EdgeInsets.only(left: 10),
//           child: TextUI('Released On : $launchOn', Colors.white, 16),
//         ),
//         Row(
//           children: [
//             Container(
//               // height: 600,
//               margin: EdgeInsets.only(left: 10, top: 10),
//               width: MediaQuery.of(context).size.width * 0.4,
//               height: MediaQuery.of(context).size.height * 0.2,
//               // padding: const EdgeInsets.only(left: 10, top: 50),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(posterUrl),
//                 ),
//               ),
//               // child: Image.network(posterUrl),
//             ),
//             Flexible(
//               fit: FlexFit.loose,
//               child: Container(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: TextUI(description, Colors.white, 15),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

//Another Design

// import 'package:filmyzilla/constants/textType.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/clip_container.dart';
import '../widgets/title_heading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Description extends StatelessWidget {
  final String name,
      description,
      bannerUrl,
      posterUrl,
      vote,
      launchOn,
      heroImage;
  const Description(this.name, this.description, this.bannerUrl, this.launchOn,
      this.posterUrl, this.vote, this.heroImage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0x252443),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(186, 30, 30, 112),
            Color(0x00070d2d),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const FaIcon(FontAwesomeIcons.angleLeft),
            splashColor: Colors.lightBlueAccent,
            tooltip: 'Previous Page',
          ),
          title: Text(
            'Detail Movie',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.bookmark),
              splashColor: Colors.lightBlueAccent,
              tooltip: 'Add BookMark',
            ),
          ],
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Stack(
              children: [
                Positioned(
                  child: Hero(
                    tag: heroImage,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        right: MediaQuery.of(context).size.width * 0.08,
                        bottom: MediaQuery.of(context).size.width * 0.08,
                        // 40,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 120, 155, 187),
                            offset: Offset(30.0, 30.0), //(x,y)
                            blurRadius: 6.0,
                            blurStyle: BlurStyle.inner,
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 48, 75, 101),
                            offset: Offset(20.0, 20.0), //(x,y)
                            // blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(posterUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            TitleHeading(name,
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
            TitleHeading(
              'Director: \$AlexPina  | $vote 🌟',
              GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Row(
              children: const [
                ClipContainer('Crime'),
                ClipContainer('Drama'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TitleHeading(
                    'Sypnosis',
                    GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                TitleHeading(
                  description,
                  GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color.fromARGB(239, 72, 140, 208),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
