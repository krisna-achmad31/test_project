

import 'package:get/get.dart';
import 'package:test_project/page/ShopPage.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    next();
  }

  void next() async {
    Future.delayed(Duration(seconds: 3),(){
      Get.offNamed(ShopPage.routedName);
    });
  }
}