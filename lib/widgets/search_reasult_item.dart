import 'package:flutter/material.dart';
import 'package:pickabook/models/book.dart';
import 'package:pickabook/screens/chat_screen.dart';

class SearchResultItem extends StatelessWidget {
  static const double cellHeight = 100;

  final Book book;

  SearchResultItem({required this.book});

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
                  Text(book.title!),
                  Text(book.author!),
                  Text(book.genere!),
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
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ChatScreen.routeName, arguments: book.owner);
                  },
                  child: Text("send request"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
