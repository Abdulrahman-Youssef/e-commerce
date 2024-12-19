import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:ecommerce_app_w/data/datasource/remote/resetverifycode.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/sharedprefkeys.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  toSuccessSignUp();
  toLogin();
  updateVerifyCode();
  reSendCode();
}

class VerifyCodeSignUpControllerImpl extends VerifyCodeSignUpController {
  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  ResetVerifyCodeData resetVerifyCodeData = ResetVerifyCodeData(Get.find());
  MyServices myServices = Get.find();

  late String verifyCode;
  String? email ;
  StatusRequest? statusRequest ;

  late String phone;
  late String username ;
  late int id;

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
        myServices.sharedpref.setString(
            AppSharedPrefKeys.userName, username);
        myServices.sharedpref
            .setInt(AppSharedPrefKeys.userID, id);
        myServices.sharedpref.setString(
            AppSharedPrefKeys.userPhone, phone);
        myServices.sharedpref.setString(
            AppSharedPrefKeys.userEmail, email!);
        myServices.sharedpref.setString(AppSharedPrefKeys.step, "2");
        Get.offAllNamed(AppRoutes.home);
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
    super.onInit();
    id = Get.arguments["id"];
    username = Get.arguments["username"];
    email = Get.arguments["email"];
    phone = Get.arguments["phone"];
    updateVerifyCode();
  }

  @override
  updateVerifyCode() {
    var respo = resetVerifyCodeData.restVerfiyCode(email.toString());
    // print("the respo in verifyCodeSignUp ${respo["status"]}");
  }

  @override
  reSendCode() {
    updateVerifyCode();
  }

}
