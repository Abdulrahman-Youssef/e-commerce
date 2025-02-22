import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/auth/forgetpassword/resetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  toSuccessResetPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  late String email;
  StatusRequest? statusRequest;

  @override
  resetPassword() async {
    if (formState.currentState!.validate()) {
      if (password.text == rePassword.text) {
        statusRequest = StatusRequest.loading;
        var response = await resetPasswordData.postData(email, password.text);
        print("the password in rest password ${password.text}");
        print("the email in reset pass ${email}");
        statusRequest = handlingData(response);
        print("the requestsatatus in reset pass ${statusRequest}");
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            Get.defaultDialog(title: "correct", middleText: "correct email");
            return true;
          } else {
            Get.defaultDialog(title: "error", middleText: "wrong email");
            return false;
          }
        } else {
          Get.defaultDialog(title: "error", middleText: "server error");
          return false;
        }
      } else {
        Get.defaultDialog(
            title: "error", middleText: "password are not the same");
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  toSuccessResetPassword() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offNamed(AppRoutes.successRestPassword);
    } else {}
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    //try to not pass it from the the prev page and take it from the forget password page to see how it really works
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
