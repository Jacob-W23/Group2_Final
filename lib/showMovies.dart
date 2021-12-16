import 'package:flutter/material.dart';
import "AppAPI.dart";

class ShowMovies extends StatefulWidget {
  final String moviePoster;
  final String movieName;
  final String movieDescription;
  final AppAPI api = new AppAPI();
  ShowMovies(this.moviePoster, this.movieName, this.movieDescription);

  @override
  _ShowMoviesState createState() =>
      _ShowMoviesState(this.moviePoster, this.movieName, this.movieDescription);
}

class _ShowMoviesState extends State<ShowMovies> {
  String moviePoster, movieName, movieDescription;
  _ShowMoviesState(this.moviePoster, this.movieName, this.movieDescription);
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
              moviePoster,
              height: 500,
              alignment: Alignment.center,
            ),
          ),
          Text(movieDescription),
          ElevatedButton(onPressed: ()=> widget.api.addItemToWishlist(moviePoster, movieName, movieDescription), child: Text("Add to wishlist"))
        ],
      ),
    );
  }
}
