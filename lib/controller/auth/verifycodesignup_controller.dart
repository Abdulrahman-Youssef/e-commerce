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
    print("response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.successSignUp );
      }else{
        print ("error in verifycodesignup_controller");
      }
    }

    Get.offNamed(AppRoutes.successSignUp);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

}
