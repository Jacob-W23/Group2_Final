class Checkout {
  final String id;
  final String checkoutItem;
  final String checkoutDescription;

  Checkout._(this.id,this.checkoutItem,this.checkoutDescription);

  factory Checkout.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final checkoutItem = json['checkoutItem'];
    final checkoutDescription = json['checkoutDescription'];

    return Checkout._(id,checkoutItem,checkoutDescription);
  }
}