import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/auth/forgetpassword/verifycode.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  toResetPassword();
}

class VerifyCodeControllerImpl extends VerifyCodeController {

  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());

  late String verifyCode;
  late String email ;
  late StatusRequest? statusRequest;
  @override
 Future<bool>  checkCode()async {

      statusRequest = StatusRequest.loading;
      var response = await verifyCodeData.postData(email , verifyCode);
      print("the email in check pass ${email}");
      statusRequest = handlingData(response);
      print("the requestsatatus in check pass ${statusRequest}");
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.defaultDialog(title: "correct", middleText: "correct code");
          return true;
        } else {
          Get.defaultDialog(title: "error", middleText: "wrong code");
          return false;
        }
      } else {
        Get.defaultDialog(title: "error", middleText: "server error");
        return false;
      }


  }

  @override
  toResetPassword() {
    Get.offNamed(AppRoutes.resetPassword , arguments: {
      "email" : email
    });
  }

  @override
  void onInit() {
    email = Get.arguments["email"];

    super.onInit();
  }

}
