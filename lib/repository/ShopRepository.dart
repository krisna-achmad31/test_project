
import 'package:test_project/models/ProductResponse.dart';
import 'package:test_project/network/api_service.dart';

import '../network/api_caller.dart';

class ShopRepository {
  ApiCaller _apiProvider = ApiCaller();

  Future<ProductResponse> getProduct() async {
    ProductResponse productResponse =await ApiService.getProduct(_apiProvider);

    return productResponse;
  }


}