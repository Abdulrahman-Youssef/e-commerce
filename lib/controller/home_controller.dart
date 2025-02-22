import 'dart:io';
import 'package:ecommerce_app_w/controller/search_controller.dart';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app_w/global/user.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCategory);

  toSearchScreen(String searchWord);
}

class HomeControllerImplementation extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  String? userName;
  SearchControllerImpl searchControllerImpl = Get.put(SearchControllerImpl());
  int? userID;

  StatusRequest statusRequest = StatusRequest.notAssigned;

  List categories = [];
  List items = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.postData();
    statusRequest = handlingData(response);
    print(statusRequest.name);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
        // getUser();
        Get.defaultDialog(title: "success fetched data", middleText: "");
        update();
      }
    }
  }

  getUser() async {
    // User.user.usersId    = await myServices.sharedpref.getInt(AppSharedPrefKeys.userID);
    // User.user.usersName  = await myServices.sharedpref.getString(AppSharedPrefKeys.userName);
    // User.user.usersPhone = await myServices.sharedpref.getString(AppSharedPrefKeys.userPhone);
    // User.user.usersEmail = await myServices.sharedpref.getString(AppSharedPrefKeys.userEmail);
  }

  @override
  initialData() {
    userName = myServices.sharedpref.getString(AppSharedPrefKeys.userName);
    userID = myServices.sharedpref.getInt(AppSharedPrefKeys.userID);
    getData();
  }

  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  @override
  goToItems(List categories, selectedCategory) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "items": items,
      "selectedCategory": selectedCategory,
    });
  }

  @override
  toSearchScreen(String searchWord) {
    Get.toNamed(AppRoutes.search, arguments: {
      "searchWord": searchWord ?? "",
    });
    searchControllerImpl.getData(searchWord);
    update();
  }
}
