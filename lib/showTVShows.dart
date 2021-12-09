import 'package:flutter/material.dart';

class ShowTVShows extends StatefulWidget {
  const ShowTVShows({Key? key}) : super(key: key);

  @override
  _ShowTVShowsState createState() => _ShowTVShowsState();
}

class _ShowTVShowsState extends State<ShowTVShows> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV Shows"),
      ),
      body: Container(),
    );
  }
}
