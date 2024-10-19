import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  toSignUp();
  toForgetPassword();
  showPassword();
}

class LoginControllerImpl extends LoginController {

  GlobalKey<FormState> fromState = GlobalKey<FormState>();

  late TextEditingController email ;
  late TextEditingController password;
  bool isShowPassword = true;
  Color iconColor = AppColor.grey ;


  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    iconColor = iconColor == AppColor.grey ? AppColor.primaryColor : AppColor.grey;
    update();
  }

  @override
  login() {
    var formData = fromState.currentState;
    if(formData!.validate()){
      print("valid");
    }else{
      print("Not Valid");
    }

  }

  @override
  toSignUp() {
    Get.offNamed(AppRoutes.signUp);
    Get.delete<LoginControllerImpl>();
  }

  @override
  toForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
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
