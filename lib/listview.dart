import 'package:flutter/material.dart';
import 'httpget.dart';

class ListScreen extends StatefulWidget {
  List<dynamic> listing;
  ListScreen({Key key, @required this.listing}) : super(key: key);
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpGet(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                padding: EdgeInsets.only(top:8),
                itemCount: widget.listing.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.listing[i] == "Press Me") {
                        widget.listing[i] = snapshot.data;
                        }else {widget.listing[i] = "Press Me";}
                      });
                    },
                    child: Align (
                      alignment: Alignment.bottomCenter,
                      child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueGrey,
                      ),
                      child: Text(
                        '${widget.listing[i]}',
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
