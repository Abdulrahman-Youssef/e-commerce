import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  toSuccessSignUp();
  toLogin();
}

class VerifyCodeSignUpControllerImpl extends VerifyCodeSignUpController {

  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());

  late String verifyCode;
  String? email ;
  StatusRequest? statusRequest ;
  @override
  checkCode() {
    throw UnimplementedError();
  }

  @override
  toLogin(){
    Get.toNamed(AppRoutes.login);
  }
  @override
  toSuccessSignUp() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignupData.postData(email!, verifyCode);
    print("verifyCodesignUpController response ${response.toString()}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.successSignUp );
      }else{
        Get.defaultDialog(title: "error" , middleText: "wrong code");
        update();
        print("error in verifycodesignup_controller");
      }
    }else{
      Get.defaultDialog(title: "error" , middleText: "server error");
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

}
