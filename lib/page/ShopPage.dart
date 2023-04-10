import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletons/skeletons.dart';
import 'package:test_project/component/AppBar.dart';
import 'package:test_project/component/colors.dart';
import 'package:test_project/component/text.dart';
import 'package:test_project/controller/ShopController.dart';
import 'package:test_project/models/cart/Cart.dart';
import 'package:test_project/repository/UserRepository.dart';

class ShopPage extends StatelessWidget {
  static const routedName = '/shopPage';

  ShopController shopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: ListView(children: [
          Column(children: [
            SizedBox(
              width: double.infinity,
              height: 64,
              child: Container(
                color: ProjectColors.projectColorBlue(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        shopController.moveToCart();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: TextRegularExo(
                          label: 'CART',
                          size: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Obx(() => shopController.loadingData.value
                ? GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: List.generate(shopController.dataProduct.length, (index) {
                      return _itemShimmer();
                    }),
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: List.generate(shopController.dataProduct.length, (index) {
                      return _item(shopController.dataProduct[index].name!, shopController.dataProduct[index].qty.toString(), index);
                    }),
                  )),
          ]),
        ]),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(4),
        child: InkWell(
          onTap: (){
            print(jsonEncode(shopController.dataProduct));
            for (var item in shopController.dataProduct){
              shopController.addToList(item);
            }
          },
          child: Container(
            height: 48,
            color: ProjectColors.projectColorMainColor(),
            child: Center(
              child: TextRegularExo(
                label: 'Add to Cart',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemShimmer() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _item(String title, String qty, int index) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: 64, width: 32, child: Image.asset('assets/img_2.png')),
              const SizedBox(
                height: 4,
              ),
              TextRegularExo(
                label: '$title',
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      shopController.loadingAdd(true);
                      shopController.minus(index);
                    },
                    child: TextRegularExo(
                      label: ' - ',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Obx(
                    () => shopController.loadingAdd.value
                        ? const SizedBox(
                            height: 4,
                            width: 4,
                            child: CircularProgressIndicator(),
                          )
                        : TextRegularExo(
                            label: shopController.dataProduct[index].item.toString(),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      shopController.loadingAdd(true);
                      shopController.add(index);
                      print('${jsonEncode(shopController.dataProduct)}');
                    },
                    child: TextRegularExo(
                      label: ' + ',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  TextRegularExo(
                    label: 'Stock Qty : ',
                    size: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  TextRegularExo(
                    label: '$qty',
                    size: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
