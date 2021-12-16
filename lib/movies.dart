import 'package:flutter/material.dart';
import 'package:group2final/showMovies.dart';
import 'main.dart';
import 'AppAPI.dart';

class Movies extends StatefulWidget {
  String moviesPoster, movieName, movieDescription;
  Movies(this.moviesPoster, this.movieName, this.movieDescription);

  final AppAPI api = new AppAPI();

  @override
  _MoviesState createState() =>
      _MoviesState(moviesPoster, movieName, movieDescription);
}

class _MoviesState extends State<Movies> {
  String moviePoster, movieName, movieDescription;
  _MoviesState(this.moviePoster, this.movieName, this.movieDescription);
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
          ? Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ...movies
                          .map<Widget>(
                            (movieParam) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: TextButton(
                                onPressed: () => {
                                  Navigator.pop(context),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Movies(
                                                movieParam['moviePoster'],
                                                movieParam['movieName'],
                                                movieParam['movieDescription'],
                                              ))),
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.purple),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
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
                                    subtitle:
                                        Text(movieParam['movieDescription']),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ShowMovies(
                                              movieParam['moviePoster'],
                                              movieParam['movieName'],
                                              movieParam['movieDescription']),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () => {
          Navigator.pop(context),
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: "Entertainment Tracker")))
        },
      ),
    );
  }
}
