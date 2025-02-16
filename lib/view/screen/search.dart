import 'package:ecommerce_app_w/controller/homescreen_controller.dart';
import 'package:ecommerce_app_w/controller/search_controller.dart';
import 'package:ecommerce_app_w/view/widget/gloablewidgets/customsearchappbar.dart';
import 'package:ecommerce_app_w/view/widget/search/search_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImpl());
   return GetBuilder<SearchControllerImpl>(builder: (controller) {
      return SafeArea(child: Scaffold(body: Obx(() {
        if (controller.items.isEmpty) {
          return Center(
            child: Text(
              "No items found!",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const CustomSearchAppBar(),
              ...List.generate(
                  controller.items.length,
                  (index) => InkWell(
                      onTap: () {
                        controller.toShowItem(controller.items[index]);
                      },
                      child: CustomSearchGridView(
                        itemsModel: controller.items[index],
                      )))
            ],
          ),
        );
      })));
    });
  }
}
