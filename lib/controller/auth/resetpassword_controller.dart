import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();

  toSuccessResetPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;

  @override
  resetPassword() {
    throw UnimplementedError();
  }

  @override
  toSuccessResetPassword() {
    var formData = formState.currentState;
    if(formData!.validate()) {
      Get.offNamed(AppRoutes.successRestPassword);
    }else{

    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
