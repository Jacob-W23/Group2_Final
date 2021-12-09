import 'package:flutter/material.dart';

class TVShows extends StatefulWidget {
  const TVShows({Key? key}) : super(key: key);

  @override
  _TVShowsState createState() => _TVShowsState();
}

class _TVShowsState extends State<TVShows> {
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
