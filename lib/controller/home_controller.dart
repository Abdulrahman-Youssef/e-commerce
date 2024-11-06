import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  String? vi;
}

class HomeControllerImplementation extends HomeController {
  MyServices myServices = Get.find();
  String? userName ;
  int? userID ;
  initialData(){
    userName = myServices.sharedpref.getString(AppSharedPrefKeys.userName);
    userID = myServices.sharedpref.getInt(AppSharedPrefKeys.userID);
}

  @override
  void onInit() {
    initialData();
    super.onInit();
  }


}