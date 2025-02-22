import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/auth/forgetpassword/forgetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  toVerfiyCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late StatusRequest? statusRequest;

  @override
  Future<bool> checkEmail() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await checkEmailData.postData(email.text);
      print("the email in check pass ${email.text}");
      statusRequest = handlingData(response);
      print("the requestsatatus in check pass ${statusRequest}");
      // print("the response in check pass ${response["status"]}"); // way is this line cuz problems
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
      return false;
    }
  }

  @override
  toVerfiyCode() {
    Get.offNamed(AppRoutes.verifyCode , arguments: {
      "email" : email.text,
    });
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
