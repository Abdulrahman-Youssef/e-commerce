import 'package:ecommerce_app_w/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum NavigationItem {
  home,
  profile,
  favorite,
  setting,
}

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> page = [
    const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text('profile'))],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text('favorite'))],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text('setting'))],
    ),
  ];

  @override
  changePage(int currentPage) {
    this.currentPage = currentPage;
    update();
  }
}
