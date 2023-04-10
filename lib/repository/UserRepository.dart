
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart/Cart.dart';

class UserRepository{

  Future<void> setCart(List<Data> cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartString = jsonEncode(cart);
    print('setCart $cartString');
    await prefs.setString('cartActive', cartString);
  }

  Future<List<Data>?> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      List<Data> cart = [];
      String? cartString = prefs.getString("cartActive");
      if (cartString != null) {
        var cartObject = jsonDecode(cartString);
        for (var item in cartObject) cart.add(Data.fromJson(item));
      }
      return cart;
    } catch (e, stacktrace) {
      print(stacktrace);
      return null;
    }
  }

  Future<List<Data>?> deletedItemCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      List<Data> cart = [];
      String? cartString = prefs.getString("cartActive");
      if (cartString != null || cartString!.isEmpty) {
        var cartObject = jsonDecode(cartString);
        for (var item in cartObject) cart.remove(Data.fromJson(item));
      }
      return cart;
    } catch (e, stacktrace) {
      print(stacktrace);
      return null;
    }
  }

  Future deleteCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("cartActive");
  }
}