import 'package:flutter/material.dart';
import 'AppAPI.dart';

class ShowTVShows extends StatefulWidget {
  final String showPoster;
  final String showName;
  final String showDescription;
  final AppAPI api = new AppAPI();
  ShowTVShows(this.showPoster, this.showName, this.showDescription);

  @override
  _ShowTVShowsState createState() =>
      _ShowTVShowsState(this.showPoster, this.showName, this.showDescription);
}

class _ShowTVShowsState extends State<ShowTVShows> {
  String showPoster, showName, showDescription;
  _ShowTVShowsState(this.showPoster, this.showName, this.showDescription);
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
              showPoster,
              height: 500,
              alignment: Alignment.center,
            ),
          ),
          Text(showDescription),
          ElevatedButton(onPressed: ()=> widget.api.addItemToWishlist(showPoster, showName, showDescription), child: Text("Add to wishlist"))
        ],
      ),
    );
  }
}
