import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/data/datasource/remote/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/function/handlingdatacontroller.dart';

abstract class LoginController extends GetxController {
  login();

  toSignUp();

  toForgetPassword();

  showPassword();
}

class LoginControllerImpl extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> fromState = GlobalKey<FormState>();

  late TextEditingController email;

  late TextEditingController password;
  bool isShowPassword = true;
  Color iconColor = AppColor.grey;

  late StatusRequest? statusRequest;

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    iconColor =
        iconColor == AppColor.grey ? AppColor.primaryColor : AppColor.grey;
    update();
  }

  @override
  login() async {
    if (fromState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print("statusRequest in login controller : ${statusRequest}");
        if (response["status"] == "success") {
          Get.defaultDialog(
              title: "correct", middleText: "correct email and password");
          Get.offAllNamed(AppRoutes.home);
        } else {
          Get.defaultDialog(
              title: "Wrong", middleText: "Wrong email and password");
        }
      }else{
        Get.defaultDialog(title: "error" , middleText: "${statusRequest}");
      }
    } else {
      print("Not Valid");
    }
  }

  @override
  toSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  toForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
