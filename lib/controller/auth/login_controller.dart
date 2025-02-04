import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/data/datasource/remote/auth/login.dart';
import 'package:ecommerce_app_w/data/model/usermodel.dart';
import 'package:ecommerce_app_w/global/user.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/function/handlingdatacontroller.dart';

abstract class LoginController extends GetxController {
  login();

  toSignUp();

  toForgetPassword();

  showPassword();

  toVerifyCodeSignUp();
}

class LoginControllerImpl extends LoginController {
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> fromState = GlobalKey<FormState>();

  late int id;

  late String username;
  late String phone;
  late TextEditingController email;

  late TextEditingController password;
  bool isShowPassword = true;
  Color iconColor = AppColor.grey;

  late StatusRequest statusRequest = StatusRequest.notAssigned;

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
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        print("statusRequest in login controller : ${statusRequest}");
        if (response["status"] == "success") {
          if (response["data"]["users_approve"] == 1) {
            myServices.sharedpref.setString(
                AppSharedPrefKeys.userName, response["data"]["users_name"]);
            myServices.sharedpref
                .setInt(AppSharedPrefKeys.userID, response["data"]["users_id"]);
            myServices.sharedpref.setString(
                AppSharedPrefKeys.userPhone, response["data"]["users_phone"]);
            myServices.sharedpref.setString(
                AppSharedPrefKeys.userEmail, response["data"]["users_email"]);
            myServices.sharedpref.setString(AppSharedPrefKeys.step, "2");
            Get.offAllNamed(AppRoutes.homeScreen);
          } else {
            id = response["data"]["users_id"];
            username = response["data"]["users_name"];
            phone = response["data"]["users_phone"];
            toVerifyCodeSignUp();
          }

          // User.user = UserModel.fromJson(response);
        } else {
          Future.delayed(
            const Duration(microseconds: 500),
            () {
              statusRequest = StatusRequest.notAssigned;
              update();
            },
          );
          // "Wrong email and password"
        }
      } else {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            statusRequest = StatusRequest.notAssigned;
            update();
            // "Wrong email and password"
          },
        );
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
    FirebaseMessaging.instance.getToken().then((value) {
      print("the token is : ${value}");
      String? token = value;
    });
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

  @override
  toVerifyCodeSignUp() {
    Get.offAllNamed(AppRoutes.verifyCodeSignUp, arguments: {
      "id": id,
      "email": email.text,
      "phone": phone,
      "username": username,
    });
  }
}
