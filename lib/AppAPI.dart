import 'package:dio/dio.dart';

const String localhost = "http://10.0.2.2:1250/";

class AppAPI {
  final _dio = Dio(BaseOptions(baseUrl: localhost));

  //Movie Route

  //Get all movies
  Future<List> getAllMovies() async {
    final response = await _dio.get('/getAllMovies');
    return response.data['Movies'];
  }

  //Show Route

  //Get all shows
  Future<List> getAllShows() async {
    final response = await _dio.get('/getAllShows');
    return response.data['Shows'];
  }

  //Wishlist Routes

  //Get wishlist
  Future<List> getWishlist() async {
    final response = await _dio.get('/getWishlist');
    return response.data['Items'];
  }

  //Add item to wishlist
  Future addItemToWishlist(String itemName) async {
    final response = await _dio.post('/addWishlistItem', data: {'wishlistItem': itemName});
  }

  //Delete item from wishlist
  Future deleteWishlistItem(String itemName) async {
    final response = await _dio.post('/deleteWishlistItem', data: {'wishlistItem': itemName});
  }

  //Checkout Routes

  //Get checkout
  Future<List> getCheckout() async {
    final response = await _dio.get('/getCheckout');
    return response.data['Items'];
  }

  //Add item to checkout
  Future addItemToCheckout(String itemName) async {
    final response = await _dio.post('/addCheckoutItem', data: {'checkoutItem': itemName});
  }

  //Delete item from check out
  Future deleteCheckoutItem(String itemName) async {
    final response = await _dio.post('/deleteCheckoutItem', data: {'checkoutItem': itemName});
  }
}