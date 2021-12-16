import 'package:flutter/material.dart';
import 'tvShows.dart';

class ShowTVShows extends StatefulWidget {
  final String showParam;
  final String showName;
  final String showDescription;
  const ShowTVShows(this.showParam, this.showName, this.showDescription);

  @override
  _ShowTVShowsState createState() =>
      _ShowTVShowsState(this.showParam, this.showName, this.showDescription);
}

class _ShowTVShowsState extends State<ShowTVShows> {
  String showParam, showName, showDescription;
  _ShowTVShowsState(this.showParam, this.showName, this.showDescription);
  bool loaded = false;
  List shows = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV Shows"),
      ),
      body: Column(
        children: [
          Title(
            color: Colors.red,
            child: Text(
              showName,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Image.network(
              showParam,
              height: 500,
              alignment: Alignment.center,
            ),
          ),
          Text(showDescription),
          ElevatedButton(onPressed: null, child: Text("Add to wishlist"))
        ],
      ),
    );
  }
}
