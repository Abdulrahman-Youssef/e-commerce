import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  toLogin();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController name;

  late TextEditingController phone;

  late TextEditingController email;

  late TextEditingController password;

  @override
  signup() {
    Get.toNamed(AppRoutes.checkEmail);
  }

  @override
  toLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    name = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    password.dispose();
    super.dispose();
  }


}
