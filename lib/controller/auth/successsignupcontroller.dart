import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {

  toLogin();
}

class SuccessSignUpControllerImpl extends SuccessSignUpController {
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
