import 'dart:io';
import 'package:ecommerce_app_w/controller/home_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:ecommerce_app_w/view/widget/home/ScrollableCategoryGallery.dart';
import 'package:ecommerce_app_w/view/widget/home/billboards.dart';
import 'package:ecommerce_app_w/view/widget/home/custom_title.dart';
import 'package:ecommerce_app_w/view/widget/gloablewidgets/customsearchappbar.dart';
import 'package:ecommerce_app_w/view/widget/home/for_you_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImplementation());
    MyServices myServices = Get.find();

    return Scaffold(
        body: GetBuilder<HomeControllerImplementation>(
            builder: (controller) => HandlingDataViewW(
                statusRequest: controller.statusRequest,
                widget: Container(
                  decoration:
                      const BoxDecoration(color: AppColor.backgroundcolor),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListView(children: [
                    const CustomSearchAppBar(),
                    const Billboard(),
                    const CustomTitle(title: "categories"),
                    ScrollableCategoryGallery(
                      controller: controller,
                    ),
                    const CustomTitle(title: "product for you"),
                    ProductList(
                      controller: controller,
                    ),
                  ]),
                ))));
  }
}

//
