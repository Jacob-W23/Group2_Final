import 'package:flutter/material.dart';
import 'main.dart';
import 'AppAPI.dart';

class Movies extends StatefulWidget {
  String id, moviesPoster, movieName, movieDescription;
  Movies(this.id, this.moviesPoster, this.movieName, this.movieDescription);

  final AppAPI api = new AppAPI();

  @override
  _MoviesState createState() =>
      _MoviesState(id, moviesPoster, movieName, movieDescription);
}

class _MoviesState extends State<Movies> {
  String id, moviePoster, movieName, movieDescription;
  _MoviesState(
      this.id, this.moviePoster, this.movieName, this.movieDescription);
  bool loaded = false;
  List movies = [];

  void initState() {
    super.initState();

    widget.api.getAllMovies().then((data) {
      setState(() {
        movies = data;
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies List"),
      ),
      body: loaded
          ? ListView(
              children: [
                ...movies
                    .map<Widget>(
                      (movieParam) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: TextButton(
                          onPressed: () => {
                            Navigator.pop(context),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Movies(
                                          movieParam['id'],
                                          movieParam['moviePoster'],
                                          movieParam['movieName'],
                                          movieParam['movieDescription'],
                                        ))),
                          },
                          child: ListTile(
                            leading: Image.network(
                              movieParam['moviePoster'],
                              width: 120.0,
                              height: 600.0,
                              fit: BoxFit.fill,
                            ),
                            title: Text(
                              (movieParam['movieName']),
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(movieParam['movieDescription']),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Database Loading",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  CircularProgressIndicator()
                ],
              ),
            ),
    );
  }
}
