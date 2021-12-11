import 'package:flutter/material.dart';
import 'movies.dart';

class ShowMovies extends StatefulWidget {
  const ShowMovies({Key? key}) : super(key: key);

  @override
  _ShowMoviesState createState() => _ShowMoviesState();
}

class _ShowMoviesState extends State<ShowMovies> {
  bool loaded = false;
  List movies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Movies"),
      ),
      body: Center(),
    );
  }
}
