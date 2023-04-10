import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/models/ProductResponse.dart' as product;
import 'package:test_project/models/cart/Cart.dart' as carts;
import 'package:test_project/page/CartPage.dart';
import 'package:test_project/repository/ShopRepository.dart';
import 'package:test_project/repository/UserRepository.dart';

import '../component/colors.dart';

class ShopController extends GetxController {
  var loadingData = false.obs;
  var loadingAdd = false.obs;

  var textQty = 0.obs;

  List<product.Data> dataProduct = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    loadingData(true);
    try {
      product.ProductResponse productResponse = await ShopRepository().getProduct();
      if (productResponse.success!) {
        for (var item in dataProduct) {
          item.item = 0;
        }
        loadingData(false);
        dataProduct = productResponse.data!;
        print(dataProduct.length);
      }
      print(productResponse);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  void add(int index) {
    dataProduct[index].item += 1;
    loadingAdd(false);
  }

  void minus(int index) {
    dataProduct[index].item -= 1;
    loadingAdd(false);
  }

  void addToList(product.Data item) async {
    List<carts.Data> cart = [];
    var existCard = await UserRepository().getCart();

    var product = carts.Data();

    product.id = item.id!;
    product.item = item.item!;
    product.name = item.name!;
    product.qty = item.qty!;
    product.price = item.price!;
    product.isActive = item.isActive!;
    product.maxOrderQty = item.maxOrderQty ?? 0;

    existCard?.add(product);
    UserRepository().setCart(existCard!);

    setCart();
  }

  void setCart() async {
    List<carts.Data> cart = [];
    var existCard = await UserRepository().getCart();
    print(existCard);

    if (existCard == 0 || existCard?.length == 0) {
      UserRepository().deleteCart();
    } else {
      if (existCard != null) {
        print('existing on cart is => ${existCard.length}');
        print(jsonEncode(existCard));
        //   cart = existCard;
        //   for (var item in cart) {
        //     if (item.id == product.id) {
        //       item.qty += 1;
        //     }
        //   }
        // } else {
        //   var productToCart = carts.Data();
        //   productToCart.id = product.id;
        //   productToCart.name = product.name;
        //   productToCart.qty = product.qty;
        //   productToCart.price = product.price;
        //   productToCart.isActive = product.isActive;
        //   productToCart.maxOrderQty = product.maxOrderQty;
        //   print(productToCart.id);
        //   cart.add(productToCart);
        // }
      }

      for (var item in cart) {
        print('cartList will save is => ${item.id} ${item.qty} ');
      }

      await UserRepository().setCart(cart);
    }
  }

  void moveToCart() async {
    Get.offNamed(CartPage.routedName);
  }
}
