import 'package:flutter/material.dart';

class SearchMultiUI extends StatelessWidget {
  final Image;
  final rating;
  const SearchMultiUI(this.Image, this.rating, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(Image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(91, 0, 0, 0),
                ),
                child: Text(rating),
              ),
            )
          ],
        );
      }),
    );
  }
}
