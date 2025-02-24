import 'package:ecommerce_app_w/core/middlewere/mymiddleware.dart';
import 'package:ecommerce_app_w/test.dart';
import 'package:ecommerce_app_w/test_view.dart';
import 'package:ecommerce_app_w/view/screen/Checkout/checkoutController.dart';
import 'package:ecommerce_app_w/view/screen/Checkout/choose_methodes.dart';
import 'package:ecommerce_app_w/view/screen/address/add_details.dart';
import 'package:ecommerce_app_w/view/screen/address/add_location_screen.dart';
import 'package:ecommerce_app_w/view/screen/address/address_screen.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/successResetPassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_app_w/view/screen/auth/login.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app_w/view/screen/auth/signup.dart';
import 'package:ecommerce_app_w/view/screen/auth/success_singup.dart';
import 'package:ecommerce_app_w/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommerce_app_w/view/screen/cartScreen.dart';
import 'package:ecommerce_app_w/view/screen/favoritescreen.dart';
import 'package:ecommerce_app_w/view/screen/home/home.dart';
import 'package:ecommerce_app_w/view/screen/home/homescreen.dart';
import 'package:ecommerce_app_w/view/screen/items.dart';
import 'package:ecommerce_app_w/view/screen/language.dart';
import 'package:ecommerce_app_w/view/screen/onboarding.dart';
import 'package:ecommerce_app_w/view/screen/search.dart';
import 'package:ecommerce_app_w/view/screen/setting_screen.dart';
import 'package:ecommerce_app_w/view/screen/showitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'core/constant/approutes.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [myMiddleware()],
  ),
  //used to go to the page im working on
  // GetPage(
  //     name: "/",
  //     page: () => const CartScreen()),
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

  GetPage(
    name: AppRoutes.home,
    page: () => const HomePage(),
  ),
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => const HomeScreen(),
  ),
 GetPage(
    name: AppRoutes.items,
    page: () => const WdItems(),
  ),
  GetPage(
    name: AppRoutes.showItems,
    page: () => const ShowItem(),
  ),
  GetPage(
    name: AppRoutes.favoriteScreen,
    page: () =>  FavoriteScreen(),
  ),
  GetPage(
    name: AppRoutes.settingScreen,
    page: () =>   SettingScreen(),
  ),
  GetPage(
    name: AppRoutes.cartScreen,
    page: () =>   const CartScreen(),
  ),
  GetPage(
    name: AppRoutes.search,
    page: () =>   const SearchScreen(),
  ),
  GetPage(
    name: AppRoutes.addressScreen,
    page: () =>    AddressScreen(),
  ),
  GetPage(
    name: AppRoutes.addLocation,
    page: () =>    AddLocationScreen(),
  ),
  GetPage(
    name: AppRoutes.addAddressDetails,
    page: () =>    AddAddressDetails(),
  ),
GetPage(
    name: AppRoutes.chooseMethodes,
    page: () =>    ChooseMethodes(),
  ),
GetPage(
    name: AppRoutes.addAddressDetails,
    page: () =>    Checkout(),
  ),


];
