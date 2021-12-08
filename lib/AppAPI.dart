import 'package:dio/dio.dart';

const String localhost = "http://10.0.2.2:1250/";

class AppAPI {
  final _dio = Dio(BaseOptions(baseUrl: localhost));

  //Movie Route
  Future<List> getAllMovies() async {
    final response = await _dio.get('/getAllMovies');
    return response.data['Movies'];
  }

  //Show Route
  Future<List> getAllShows() async {
    final response = await _dio.get('/getAllShows');
    return response.data['Shows'];
  }

  //Wishlist Routes
  Future addItemToWishlist(String itemName) async {
    final response = await _dio.post('/addWishlistItem', data: {'wishlistItem': itemName});
  }

  Future deleteWishlistItem(String itemName) async {
    final response = await _dio.post('/deleteWishlistItem', data: {'wishlistItem': itemName});
  }

  //Checkout Routes
  Future addItemToCheckout(String itemName) async {
    final response = await _dio.post('/addCheckoutItem', data: {'checkoutItem': itemName});
  }

  Future deleteCheckoutItem(String itemName) async {
    final response = await _dio.post('/deleteCheckoutItem', data: {'checkoutItem': itemName});
  }
}