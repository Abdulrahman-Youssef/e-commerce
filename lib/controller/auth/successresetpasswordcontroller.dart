import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  toLogin();
}

class SSuccessResetPasswordControllerImpl extends SuccessResetPasswordController {
  late String verifyCode;


  @override
  toLogin(){
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    super.onInit();
  }

}
