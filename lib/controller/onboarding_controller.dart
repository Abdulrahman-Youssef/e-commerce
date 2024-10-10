import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {

  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;


  @override
  next() {
    if(currentPage >= onBoaridingList.length -1 )
      {
        Get.offAllNamed(AppRoutes.login);
      }
    currentPage++;
    pageController.animateToPage(
        currentPage, duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut);
    
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

}