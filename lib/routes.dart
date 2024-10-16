import 'package:ecommerce_app_w/view/screen/auth/checkemail.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/successResetPassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_app_w/view/screen/auth/login.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/signup.dart';
import 'package:ecommerce_app_w/view/screen/auth/success_singup.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommerce_app_w/view/screen/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'core/constant/approutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // auth
  AppRoutes.login: (context) => const Login(),
  AppRoutes.signUp: (context) => const SignUp(),
  AppRoutes.forgetPassword: (context) => const ForgetPassword(),
  AppRoutes.verifyCode: (context) => const VerfiyCode(),
  AppRoutes.resetPassword: (context) => const ResetPassword(),
  AppRoutes.successRestPassword: (context) => const SuccessResetPassword(),
  AppRoutes.successSignUp: (context) => const SuccessSingUp(),
  AppRoutes.checkEmail: (context) => const CheckEmail(),
  AppRoutes.verifySignUp: (context) => const VerfiyCodeSignUp(),
  //onBoarding
  AppRoutes.onBoarding: (context) => const OnBoarding(),

};
