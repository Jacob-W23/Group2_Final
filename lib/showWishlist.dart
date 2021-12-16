import 'package:flutter/material.dart';
import 'wishList.dart';

class ShowWishlist extends StatefulWidget {
  final String wishParam;
  final String wishlistItem;
  final String itemDescription;
  const ShowWishlist(this.wishParam, this.wishlistItem, this.itemDescription);

  @override
  _ShowWishlistState createState() => _ShowWishlistState(
      this.wishParam, this.wishlistItem, this.itemDescription);
}

class _ShowWishlistState extends State<ShowWishlist> {
  String wishParam;
  String wishlistItem;
  String itemDescription;
  _ShowWishlistState(this.wishParam, this.wishlistItem, this.itemDescription);
  bool loaded = false;
  List wishes = [];
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
              wishParam,
              height: 500,
              alignment: Alignment.center,
            ),
          ),
          Text(itemDescription),
        ],
      ),
    );
  }
}
