import 'package:flutter/material.dart';
import 'package:group2final/showTVShows.dart';
import "main.dart";
import "AppAPI.dart";

class TVShows extends StatefulWidget {
  String showPoster, showName, showDescription;
  TVShows(this.showPoster, this.showName, this.showDescription);

  final AppAPI api = new AppAPI();

  @override
  _TVShowsState createState() =>
      _TVShowsState(showPoster, showName, showDescription);
}

class _TVShowsState extends State<TVShows> {
  String showPoster, showName, showDescription;
  _TVShowsState(this.showPoster, this.showName, this.showDescription);
  bool loaded = false;
  List tvshows = [];

  void initState() {
    super.initState();

    widget.api.getAllShows().then((data) {
      tvshows = data;
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV Shows"),
      ),
      body: loaded
          ? Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ...tvshows
                          .map<Widget>(
                            (showParam) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: TextButton(
                                onPressed: () => {
                                  Navigator.pop(context),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TVShows(
                                                showParam['showPoster'],
                                                showParam['showName'],
                                                showParam['showDescription'],
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
                                      showParam['showPoster'],
                                      width: 120.0,
                                      height: 600.0,
                                      fit: BoxFit.fill,
                                    ),
                                    title: Text(
                                      (showParam['showName']),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle:
                                        Text(showParam['movieDescription']),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ShowTVShows(
                                              showParam['showPoster'],
                                              showParam['showName'],
                                              showParam['showDescription']),
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
