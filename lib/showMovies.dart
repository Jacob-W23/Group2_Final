import 'package:flutter/material.dart';
import 'movies.dart';

class ShowMovies extends StatefulWidget {
  final String moviesParam;
  final String movieName;
  final String movieDescription;
  const ShowMovies(this.moviesParam, this.movieName, this.movieDescription);

  @override
  _ShowMoviesState createState() =>
      _ShowMoviesState(this.moviesParam, this.movieName, this.movieDescription);
}

class _ShowMoviesState extends State<ShowMovies> {
  String moviesParam, movieName, movieDescription;
  _ShowMoviesState(this.moviesParam, this.movieName, this.movieDescription);
  bool loaded = false;
  List movies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body: Column(
        children: [
          Title(
            color: Colors.red,
            child: Text(
              movieName,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Image.network(
              moviesParam,
              height: 500,
              alignment: Alignment.center,
            ),
          ),
          Text(movieDescription),
          ElevatedButton(onPressed: null, child: Text("Add to wishlist"))
        ],
      ),
    );
  }
}
