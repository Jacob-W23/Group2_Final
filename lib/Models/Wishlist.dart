class Wishlist {
  final String id;
    final String wishlistPoster;
  final String wishlistItem;
  final String itemDescription;

  Wishlist._(this.id,this.wishlistPoster,this.wishlistItem,this.itemDescription);

  factory Wishlist.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final wishlistPoster = json['wishlistPoster'];
    final wishlistItem = json['wishlistItem'];
    final itemDescription = json['itemDescription'];

    return Wishlist._(id,wishlistPoster,wishlistItem,itemDescription);
  }
}