import 'package:ecommerce_app_w/controller/items_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:ecommerce_app_w/view/widget/home/ScrollableCategoryGallery.dart';
import 'package:ecommerce_app_w/view/widget/gloablewidgets/customsearchappbar.dart';
import 'package:ecommerce_app_w/view/widget/items/categories.dart';
import 'package:ecommerce_app_w/view/widget/items/gridviewitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class WdItems extends StatelessWidget {
  const WdItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(builder: (controller) {
          return HandlingDataViewW(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView(
                  children: [
                    const CustomSearchAppBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Categories(),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 0,
                          crossAxisCount: 2,
                          childAspectRatio:
                              .9, // Adjusts the height to width ratio of each item
                        ),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomGridViewItems(
                              itemsModel:
                                  ItemsModel.fromJson(controller.items[index]));
                        }),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
