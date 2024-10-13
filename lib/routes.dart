import 'package:ecommerce_app_w/view/screen/auth/login.dart';
import 'package:ecommerce_app_w/view/screen/auth/signup.dart';
import 'package:ecommerce_app_w/view/screen/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'core/constant/approutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => const Login(),
  AppRoutes.signUp: (context) => const SignUp(),
  AppRoutes.onBoarding: (context) => const OnBoarding(),
};
