import 'package:dio/dio.dart';

const String localhost = "http://10.0.2.2:1200/";

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
  Future<List> getShows() async {
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
  Future addItemToWishlist(String itemPoster,String itemName,String itemDescription) async {
    final response = await _dio.post('/addWishlistItem', data: {'wishlistPoster':itemPoster,'wishlistItem': itemName,'itemDescription':itemDescription});
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
  Future addItemToCheckout(String itemPoster,String itemName,String itemDescription) async {
    final response = await _dio.post('/addCheckoutItem', data: {'checkoutPoster':itemPoster,'checkoutItem': itemName,'checkoutDescription':itemDescription});
  }

  //Delete item from check out
  Future deleteCheckoutItem(String itemName) async {
    final response = await _dio.post('/deleteCheckoutItem', data: {'checkoutItem': itemName});
  }
}