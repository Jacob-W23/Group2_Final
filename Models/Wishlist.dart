class Wishlist {
  final String id;
  final String wishlistItem;
  final String itemDescription;

  Wishlist._(this.id,this.wishlistItem,this.itemDescription);

  factory Wishlist.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final wishlistItem = json['wishlistItem'];
    final itemDescription = json['itemDescription'];

    return Wishlist._(id,wishlistItem,itemDescription);
  }
}