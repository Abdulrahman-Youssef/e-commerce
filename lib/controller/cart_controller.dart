import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/data/datasource/remote/cart/cart_data.dart';
import 'package:ecommerce_app_w/data/model/cart_item.dart';
import 'package:ecommerce_app_w/global/user.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:get/get.dart';

import '../core/function/handlingdatacontroller.dart';

abstract class CartController extends GetxController {
  initialData();
  removeItem(int cartID);
  putItem(int itemID);
}

class CartControllerImpl extends CartController {
  List cartItemsList = [].obs;
  List<CartItem> cartItem = <CartItem>[].obs;

  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  @override
  void initialData() {
    getData();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getItems(
        myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString());
    print("response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        cartItemsList = response["data"];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void removeItem(int cartID) async {
    await cartData.removeItem(
        myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString(),
        cartID.toString());

    cartItemsList.removeWhere((item) => item["cartID"] == cartID);
  }

  @override
  void putItem(int itemID) async {
    var response = await cartData.putItem(
        myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString(),
        itemID.toString());
    if(responseResult(response)!) {
      getData();
    }
  }

  bool? responseResult(var response) {
    if (response["status"] == "failure") {
      return false;
    } else if(response["status"] == "success") {
      return true;
    }
    return null ;
    }

  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  @override
  void onClose() {
    super.onClose();
    print('this is the onClose in the cart implement');
  }
}
