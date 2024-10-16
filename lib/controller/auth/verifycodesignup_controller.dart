import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  toSuccessSignUp();
  toLogin();
}

class VerifyCodeSignUpControllerImpl extends VerifyCodeSignUpController {
  late String verifyCode;

  @override
  checkCode() {
    throw UnimplementedError();
  }

  @override
  toLogin(){
    Get.toNamed(AppRoutes.login);
  }
  @override
  toSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }

  @override
  void onInit() {

    super.onInit();
  }

}
