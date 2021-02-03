import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  static const double cellHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/image26.png',
                height: cellHeight,
              ),
            ),
          ),
          Container(
            child: Container(
              height: cellHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("title"),
                  Text("author"),
                  Text("genere"),
                  Spacer(),
                  Text("פנוי‎"),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: cellHeight,
            child: Column(
              children: [
                Spacer(),
                Text("send request"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
