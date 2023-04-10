

import 'dart:collection';

import 'package:test_project/models/ProductResponse.dart';
import 'package:test_project/network/api_caller.dart';

class ApiService {
  static Future<ProductResponse> getProduct(ApiCaller apiProvider) async {
    final response = await apiProvider.get('products', {});
    ProductResponse productResponse = ProductResponse.fromJson(response);

    return productResponse;

  }

}
