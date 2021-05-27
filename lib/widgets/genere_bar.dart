import 'package:flutter/material.dart';

class GenereBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(color: Color(0xFFFFF7EA)),
      child: Text(
        "generes",
        style: TextStyle(
          backgroundColor: Color(0xFFFFF7EA),
        ),
      ),
    );
  }
}
