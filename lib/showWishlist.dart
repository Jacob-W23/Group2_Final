import 'package:flutter/material.dart';
import "AppAPI.dart";
import 'main.dart';

class ShowWishlist extends StatefulWidget {
  final String wishlistPoster;
  final String wishlistItem;
  final String itemDescription;
  final AppAPI api = new AppAPI();
  ShowWishlist(this.wishlistPoster, this.wishlistItem, this.itemDescription);

  @override
  _ShowWishlistState createState() => _ShowWishlistState(
      this.wishlistPoster, this.wishlistItem, this.itemDescription);
}

class _ShowWishlistState extends State<ShowWishlist> {
  String wishlistPoster;
  String wishlistItem;
  String itemDescription;
  _ShowWishlistState(this.wishlistPoster, this.wishlistItem, this.itemDescription);
  bool loaded = false;
  List wishes = [];

  void _deleteItem(name) {
    setState(() {
      Navigator.pop(context);
      widget.api.deleteWishlistItem(name);
      Navigator.pop(context);
    });
  }

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
              wishlistItem,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Image.network(
              wishlistPoster,
              height: 500,
              alignment: Alignment.center,
            ),
          ),
          Text(itemDescription),
          ElevatedButton(onPressed: ()=> _deleteItem(wishlistItem), child: Text("Remove from wishlist"))
        ],
      ),
    );
  }
}
