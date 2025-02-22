import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myMiddleware extends GetMiddleware{
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedpref.getString(AppSharedPrefKeys.step) == "2"){
      return const RouteSettings(name: AppRoutes.homeScreen);
    }else if(myServices.sharedpref.getString(AppSharedPrefKeys.step) == "1"){
      return const RouteSettings(name: AppRoutes.login);
    }
  }

}