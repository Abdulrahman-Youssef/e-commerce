import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/data/datasource/remote/cart/cart_data.dart';
import 'package:ecommerce_app_w/data/model/cart_item.dart';
import 'package:ecommerce_app_w/global/user.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/function/handlingdatacontroller.dart';

abstract class CartController extends GetxController {
  initialData();

  removeItem(int cartID, int itemCount);

  putItem(int itemID, int itemCount);

  increaseItemCount(int cartID);

  decreaseItemCount(int cartID);
  
  _getTotalPrice();
}

class CartControllerImpl extends CartController {
  // List cartItems = [].obs;
  List<CartItemModel> cartItems = <CartItemModel>[].obs;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  double totalPrice = 0;
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
        cartItems.assignAll((response["data"] as List)
            .map((e) => CartItemModel.fromJson(e))
            .toList());
      } else {
        statusRequest = StatusRequest.failure;
        print("clear the cartItems ");
        cartItems.clear();
      }
    }else{
      print("clear the cartItems ");
      cartItems.clear();
    }
    _getTotalPrice();
    update();
  }

  @override
  void removeItem(int cartID, int itemCount) async {
    var response = await cartData.removeItem(
      myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString(),
      cartID.toString(),
      itemCount.toString(),
    );
    // cartItems.removeWhere((item) => item.cartID == cartID);
    if (responseResult(response)!) {
      getData();
    }
    update();
  }

  @override
  void putItem(int itemID, int itemCount) async {
    var response = await cartData.putItem(
      myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString(),
      itemID.toString(),
      itemCount: itemCount.toString(),
    );
    if (responseResult(response)!) {
      getData();
    }
    update();
  }

  bool? responseResult(var response) {
    if (response["status"] == "failure") {
      return false;
    } else if (response["status"] == "success") {
      return true;
    }
    return null;
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

  @override
  decreaseItemCount(int cartID) {
    int index = cartItems.indexWhere((item) => item.cartID == cartID);
    if (index != -1) {
      cartItems[index].itemCount = (cartItems[index].itemCount ?? 0) + 1;
      update(); // Notify the UI to update
    }
  }

  @override
  increaseItemCount(int cartID) {
    int index = cartItems.indexWhere((item) => item.cartID == cartID);
    if (index != -1) {
      cartItems[index].itemCount = (cartItems[index].itemCount ?? 0) - 1;
      update();
    }
  }

  @override
  _getTotalPrice() {
    totalPrice= 0 ;
    cartItems.forEach((element){
      totalPrice +=  (element.itemsPrice! - (element.itemsPrice! * (element.itemsDiscount!) / 100 ) )  * element.itemCount!;
    });
  }
}
