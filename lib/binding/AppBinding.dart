
import 'package:get/get.dart';
import 'package:test_project/controller/CartController.dart';
import 'package:test_project/controller/ShopController.dart';

class AppBinding extends Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ShopController>(() => ShopController(), fenix: true);
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
  }
}