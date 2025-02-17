import 'package:ecommerce_app_w/controller/search_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/view/widget/gloablewidgets/customsearchappbar.dart';
import 'package:ecommerce_app_w/view/widget/search/search_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchControllerImpl controller = Get.put(SearchControllerImpl());

    return GetBuilder<SearchControllerImpl>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const CustomSearchAppBar(), // Search bar stays at the top
                Expanded(
                  child: HandlingDataViewW(
                    statusRequest: controller.statusRequest,
                    widget: controller.items.isEmpty
                        ? Center(
                      child: Text(
                        "No items found!",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey[600]),
                      ),
                    )
                        : GridView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          controller.toShowItem(controller.items[index]);
                        },
                        child: CustomSearchGridView(
                          itemsModel: controller.items[index],
                        ),
                      ),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        crossAxisCount: 2, // Shows two items per row
                        childAspectRatio: 0.74, // Adjusts item size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
