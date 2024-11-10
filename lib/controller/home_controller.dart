import 'dart:io';

import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
}

class HomeControllerImplementation extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  String? userName;

  int? userID;

  StatusRequest statusRequest = StatusRequest.notAssigned;

  List categories = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.postData();
    statusRequest = handlingData(response);
    print(statusRequest.name);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response["categories"]);
        Get.defaultDialog(
            title: "success fetched data",
            middleText: "${categories[3]["categories_image"]}");
        update();
      }
    }
  }

  @override
  initialData() {
    userName = myServices.sharedpref.getString(AppSharedPrefKeys.userName);
    userID = myServices.sharedpref.getInt(AppSharedPrefKeys.userID);
    getData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
