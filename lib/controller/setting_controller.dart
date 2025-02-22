import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

abstract class SettingController extends GetxController {
  logout(bool result);

  changeNotificationSwitch(bool switchNotification);

  toAddressScreen();
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

  @override
  changeNotificationSwitch(bool switchNotification) {
    notification = !switchNotification;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // get it from shared pref not always on
    notification = true;
  }

  @override
  toAddressScreen() {
    // TODO: implement toAddressScreen
    Get.toNamed(AppRoutes.addressScreen);
  }
}
