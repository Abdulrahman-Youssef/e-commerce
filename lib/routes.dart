import 'package:ecommerce_app_w/core/middlewere/mymiddleware.dart';
import 'package:ecommerce_app_w/test.dart';
import 'package:ecommerce_app_w/test_view.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/successResetPassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_app_w/view/screen/auth/login.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/signup.dart';
import 'package:ecommerce_app_w/view/screen/auth/success_singup.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommerce_app_w/view/screen/language.dart';
import 'package:ecommerce_app_w/view/screen/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'core/constant/approutes.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: "/",
  //   page: () => const Language(),
  //   middlewares: [myMiddleware()],
  // ),
  GetPage(
      name: "/",
      page: () => const TestView()),
  // auth routes
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerfiyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successRestPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successSignUp,
    page: () => const SuccessSingUp(),
  ),
  GetPage(
    name: AppRoutes.verifyCodeSignUp,
    page: () => const VerfiyCodeSignUp(),
  ),

  // onBoarding route
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoarding(),
  ),
];
