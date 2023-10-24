import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/api/model/resource_model.dart';
import 'package:rainbow/routs/subRoute/sub_route.dart';
import 'package:rainbow/utils/image_utils.dart';

class DashboardController extends GetxController {
  ProductDetails? productDetails;
  var count = 0;
  RxBool isLoading = false.obs;
  List<Widget> imageList = [];
  RxList<String> menuList = <String>[].obs;
  List<String> phoneList = [];
  RxString? address = ''.obs;
  RxString? shopName = ''.obs;

  double lat = 0.0;
  double long = 0.0;
  void navigateBody(int index) {
    Get.to(SubRoute(product: productDetails!.productList![index]));
  }

  void getResources(ProductDetails? productDetail) {
    productDetails = productDetail;
    createDashBoardList();
  }

  void createDashBoardList() {
    imageList.clear();
    menuList.clear();
    phoneList.clear();
    address!.value = productDetails!.address!;
    shopName!.value = productDetails!.shopName!;
     lat = double.parse(productDetails!.coordinates!.lat!);
     long = double.parse(productDetails!.coordinates!.long!);
    productDetails!.productList!.forEach((element) {
      imageList.add(InkWell(
          onTap: () {
            Get.to(SubRoute(product: element));
          },
          child: ImageUtil.getNetworkImage(element.images![0])));
      menuList.add(element.name!);
    });
    productDetails!.contacts!.forEach((element) {
      phoneList.add(element);
    });
    update();
  }
}
