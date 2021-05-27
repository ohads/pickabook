import 'package:flutter/material.dart';
// import 'package:barras/barras.dart';
import 'package:http/http.dart' as http;

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String scan = "";

  void scanA() async {
    final code = 1; //await Barras.scan(context);
    if (code == null) {
      return;
    }
    final uri = Uri(
        host: "www.googleapis.com",
        scheme: "https",
        path: "/books/v1/volumes",
        query: "q=$code");

    print(uri);
    final json = await http.get(uri);
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
            TextButton(onPressed: scanA, child: Text("scan")),
            Text(scan),
          ],
        ),
      ),
    );
  }
}
