import 'package:ecommerce_app_w/view/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {

  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;


  @override
  next() {
    if(currentPage >= 3 )
      {
        Get.off(Login());
      }
    print(currentPage);
    currentPage++;
    pageController.animateToPage(
        currentPage, duration: Duration(milliseconds: 900),
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