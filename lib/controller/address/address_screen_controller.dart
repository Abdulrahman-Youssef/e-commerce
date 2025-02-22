import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/data/datasource/remote/address/addressData.dart';
import 'package:ecommerce_app_w/data/model/address_model.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/sharedprefkeys.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class AddressScreenController extends GetxController {
  getData();

  toAddLocationScreen();
}

class AddressScreenControllerImpl extends AddressScreenController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  List<AddressModel> addresses = <AddressModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(
        myServices.sharedpref.getInt(AppSharedPrefKeys.userID).toString());
    print("response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        addresses.assignAll((response["data"] as List)
            .map((e) => AddressModel.fromJson(e))
            .toList());
      } else {
        statusRequest = StatusRequest.failure;
        print("clear the addresses ");
        addresses.clear();
      }
    } else {
      print("clear the addresses ");
      addresses.clear();
    }
    update();
  }

  Future<List<AddressModel>> getAddresses() async {
    await getData();
    return addresses;
  }

  removeAddress(int addressID) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.removeAddress(addressID.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        int index = addresses.indexWhere((a) {
          return a.addressId == addressID;
        });
        addresses.removeAt(index);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  toAddLocationScreen() {
    Get.toNamed(AppRoutes.addLocation);
  }
}
