import 'package:flutter/material.dart';
import 'package:pickabook/providers/books_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/distance_slider.dart';
import '../widgets/genere_bar.dart';
import '../widgets/search_reasult_item.dart';
import '../providers/books_provider.dart';
import '../models/book.dart';

class SearchListScreen extends StatefulWidget {
  @override
  _SearchListScreenState createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<Books>(context);
    final books = booksProvider.books;
    final availableBooks = books.where((book) {
      return book.title!
          .toLowerCase()
          .contains(searchController.text.toLowerCase());
    });
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: AppBar(
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 30,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Theme.of(context).primaryColor,
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      isDense: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            DistanceSlider(),
            GenereBar(),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text("header"),
                  for (Book book in availableBooks) SearchResultItem(book: book)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
