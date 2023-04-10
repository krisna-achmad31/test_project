
import 'package:get/get.dart';
import 'package:test_project/models/cart/Cart.dart';
import 'package:test_project/repository/UserRepository.dart';

class CartController extends GetxController{

  List<Data?> dataCart = [];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    var data = UserRepository().getCart();
    dataCart = data as List<Data?>;
    print(dataCart);
  }
}