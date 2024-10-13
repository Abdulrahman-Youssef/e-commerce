import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  toSignUp();
}

class LoginControllerImpl extends LoginController {
  late TextEditingController email ;
  late TextEditingController password;

  @override
  login() {
    throw UnimplementedError();
  }

  @override
  toSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    email  =TextEditingController();
    password  =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

}
