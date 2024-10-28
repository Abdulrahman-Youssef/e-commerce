import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();

  toLogin();
}

class SignUpControllerImpl extends SignUpController {
  GlobalKey<FormState> fromState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  List data = [];
  late StatusRequest statusRequest;

  SignupData signupData = SignupData(Get.find());

  @override
  signup() async{
    if (fromState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupData.postData(name.text, password.text, email.text, phone.text);
      print("response $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          Get.offNamed(AppRoutes.verifyCodeSignUp);

        } else {
          Get.defaultDialog(title: "Waring" ,middleText: "phone or email is already exist");
          statusRequest = StatusRequest.failure;
          update();
        }
      }
      update();


      // Get.toNamed(AppRoutes.verifyCodeSignUp);
      // Get.delete<SignUpControllerImpl>();
    } else {
      print("Not Valid");
    }
  }

  @override
  toLogin() {
    Get.offNamed(AppRoutes.login);
    Get.delete<SignUpControllerImpl>();
  }

  @override
  void onInit() {
    name = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    password.dispose();
    super.dispose();
  }
}
