import 'package:get/get.dart';
import 'package:rainbow/api/api_call.dart';
import 'package:rainbow/api/model/resource_model.dart';
import 'package:rainbow/constants/network_constants.dart';
import 'package:rainbow/routs/dashboard/dash_board.dart';

class StoreController extends GetxController {

  getResources() async {
    ApiCall apiCall = ApiCall();
    ProductDetails? productDetails =
    await apiCall.getResources(resourceBaseUrl);
    print(productDetails!.productList!.length.toString());
    Get.offAll(DashBoard(productDetails : productDetails));
  }
}
