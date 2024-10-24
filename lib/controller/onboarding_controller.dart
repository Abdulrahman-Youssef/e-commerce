import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  MyServices myServices = Get.find();

  next();

  skip();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;

  @override
  next() {
    if (currentPage >= onBoaridingList.length - 1) {
      myServices.sharedpref.setBool(AppSharedPrefKeys.isOnboardingSeen, true);
      Get.offAllNamed(AppRoutes.login);
    }
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();

    super.onInit();
  }

  @override
  skip() {
    myServices.sharedpref.setBool(AppSharedPrefKeys.isOnboardingSeen, true);
    Get.offAllNamed(AppRoutes.login);
  }
}
