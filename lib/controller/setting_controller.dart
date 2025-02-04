import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

abstract class SettingController extends GetxController {
  logout(bool result);
}

class SettingControllerImpl extends SettingController {
  MyServices myServices = Get.find();
  late bool? result;
  late bool notification;
  @override
  logout(bool result) async {
    // will in future take the user token

    if (result ?? false) {
      myServices.sharedpref.clear();
      Get.offNamed(AppRoutes.login);
    }
  }
}