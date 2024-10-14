import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  toResetPassword();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  late String verifyCode;

  @override
  checkCode() {
    throw UnimplementedError();
  }

  @override
  toResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {

    super.onInit();
  }

}
