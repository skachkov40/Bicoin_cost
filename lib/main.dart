import 'package:flutter/material.dart';
import 'listview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<dynamic> listing;
  MyApp({Key key, @required this.listing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    listing = List<dynamic>.generate(
      500,
      (i) => ('Press Me'),
    );
    return MaterialApp(
      title: 'Bitcoin API',
      theme: ThemeData(
      ),
      home: Scaffold(
        backgroundColor: new Color(0xFF182539),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: ListScreen(
              listing: listing,
            ),
          ),
        ),
      ),
    );
  }
}
