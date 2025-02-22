import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/address/addressData.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:ecommerce_app_w/view/screen/address/add_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddDetailsController extends GetxController {}

class AddDetailsControllerImpl extends AddDetailsController {
  TextEditingController addressName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  late StatusRequest statusRequest;
  late double lat;

  late double long;

  addAddressDetails() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.addAddress(
        myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString(),
        addressName.text.toString(),
        city.text.toString(),
        street.text.toString(),
        lat.toString(),
        long.toString());
    // print("response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {

    } else {
      print("clear the cartItems ");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();

    lat =  Get.arguments["lat"];
    long = Get.arguments["long"];
  }
}
