import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  toVerfiyCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  @override
  checkEmail() {
    throw UnimplementedError();
  }

  @override
  toVerfiyCode() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offNamed(AppRoutes.verifyCode);
    }
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
