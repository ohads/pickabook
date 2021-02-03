import 'package:flutter/material.dart';
import 'package:barras/barras.dart';
import 'package:http/http.dart' as http;

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String scan = "";

  void scanA() async {
    final code = await Barras.scan(context);
    final json =
        await http.get("https://www.googleapis.com/books/v1/volumes?q=$code");
    setState(() {
      scan = json.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(scan),
            FlatButton(onPressed: scanA, child: Text("scan"))
          ],
        ),
      ),
    );
  }
}
