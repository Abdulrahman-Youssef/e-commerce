import 'package:ecommerce_app_w/view/screen/favoritescreen.dart';
import 'package:ecommerce_app_w/view/screen/home/home.dart';
import 'package:ecommerce_app_w/view/screen/profile.dart';
import 'package:ecommerce_app_w/view/screen/search.dart';
import 'package:ecommerce_app_w/view/screen/setting_screen.dart';
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
  Map<String, List> pageName = {
    "pageName": [
      "home",
      "favorite",
      "profile",
      "setting",
    ],
    "icons" : [
      Icons.home,
      Icons.favorite,
      Icons.person,
      Icons.settings,
    ]
  };

  List<Widget> page = [
    const HomePage(),
    FavoriteScreen(),
    const ProfileScreen(),
     SettingScreen(),
    const SearchScreen(),
  ];

  @override
  changePage(int currentPage) {
    this.currentPage = currentPage;
    update();
  }
}
