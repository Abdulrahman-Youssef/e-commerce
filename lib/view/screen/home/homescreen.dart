import 'package:ecommerce_app_w/controller/homescreen_controller.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/view/widget/home/custombottomappbar.dart';
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
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cartScreen);
            },
            shape: const CircleBorder(),
            child: const Icon(
              Icons.shopify,
              size: 50,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: const CustomBottomAppbar(),
      );
    });
  }
}
