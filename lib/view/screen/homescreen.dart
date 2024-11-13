import 'package:ecommerce_app_w/controller/homescreen_controller.dart';
import 'package:ecommerce_app_w/view/widget/home/customappbarbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
        body: controller.page.elementAt(controller.currentPage),
        // backgroundColor: Colors.red,
        floatingActionButton: SizedBox(
          height: 100,
          width: 70,
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(
              Icons.shopify,
              size: 50,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomAppbarButton(
                    text: "Home",
                    icon: Icons.home,
                    selected: controller.currentPage == 0 ? true : false,
                    onPressed: () {
                      controller.changePage(0);
                    },
                  ),
                  CustomAppbarButton(
                    text: "profile",
                    icon: Icons.person,
                    selected: controller.currentPage == 1 ? true : false,
                    onPressed: () {
                      controller.changePage(1);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  CustomAppbarButton(
                    text: "favorite",
                    selected: controller.currentPage == 2 ? true : false,
                    icon: CupertinoIcons.heart,
                    onPressed: () {
                      controller.changePage(2);
                    },
                  ),
                  CustomAppbarButton(
                    text: "setting",
                    selected: controller.currentPage == 3 ? true : false,
                    icon: Icons.settings,
                    onPressed: () {
                      controller.changePage(3);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
