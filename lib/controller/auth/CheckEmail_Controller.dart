import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  toVerifyCodeSignUp();
}

class CheckEmailControllerImpl extends CheckEmailController {
  late TextEditingController email;
  @override
  checkEmail() {
    throw UnimplementedError();
  }

  @override
  toVerifyCodeSignUp() {
    Get.toNamed(AppRoutes.verifySignUp );
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
