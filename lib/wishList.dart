import 'package:flutter/material.dart';
import 'package:group2final/showWishlist.dart';
import "main.dart";
import "AppAPI.dart";

class WishList extends StatefulWidget {
  String wishlistPoster, wishlistItem, itemDescription;
  WishList(this.wishlistPoster, this.wishlistItem, this.itemDescription);

  final AppAPI api = new AppAPI();

  @override
  _WishListState createState() =>
      _WishListState(wishlistPoster, wishlistItem, itemDescription);
}

class _WishListState extends State<WishList> {
  String wishlistPoster, wishlistItem, itemDescription;
  _WishListState(this.wishlistPoster, this.wishlistItem, this.itemDescription);
  bool loaded = false;
  List wishes = [];

  void initState() {
    super.initState();

    widget.api.getWishlist().then((data) {
      setState(() {
        wishes = data;
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wish List"),
      ),
      body: loaded
          ? Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ...wishes
                          .map<Widget>(
                            (wishParam) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: TextButton(
                                onPressed: () => {
                                  Navigator.pop(context),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WishList(
                                                wishParam['wishlistPoster'],
                                                wishParam['wishlistItem'],
                                                wishParam['itemDescription'],
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
                                      wishParam['wishlistPoster'],
                                      width: 120.0,
                                      height: 600.0,
                                      fit: BoxFit.fill,
                                    ),
                                    title: Text(
                                      (wishParam['wishlistItem']),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle:
                                        Text(wishParam['itemDescription']),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ShowWishlist(
                                              wishParam['wishlistPoster'],
                                              wishParam['wishlistItem'],
                                              wishParam['itemDescription']),
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
