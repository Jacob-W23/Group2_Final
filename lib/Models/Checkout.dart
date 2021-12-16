class Checkout {
  final String id;
  final String checkoutPoster;
  final String checkoutItem;
  final String checkoutDescription;

  Checkout._(this.id,this.checkoutPoster,this.checkoutItem,this.checkoutDescription);

  factory Checkout.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final checkoutPoster = json['checkoutPoster'];
    final checkoutItem = json['checkoutItem'];
    final checkoutDescription = json['checkoutDescription'];

    return Checkout._(id,checkoutPoster,checkoutItem,checkoutDescription);
  }
}