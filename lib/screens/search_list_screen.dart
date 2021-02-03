import 'package:flutter/material.dart';
import 'package:pickabook/widgets/distance_slider.dart';

import '../widgets/genere_bar.dart';
import '../widgets/search_reasult_item.dart';

class SearchListScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  SearchResultItem(),
                  SearchResultItem(),
                  SearchResultItem(),
                  SearchResultItem(),
                  SearchResultItem(),
                  SearchResultItem(),
                  SearchResultItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
