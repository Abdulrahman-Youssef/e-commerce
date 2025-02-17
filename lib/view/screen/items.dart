import 'package:ecommerce_app_w/controller/items_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/ItemsCategoryView.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:ecommerce_app_w/view/widget/home/ScrollableCategoryGallery.dart';
import 'package:ecommerce_app_w/view/widget/gloablewidgets/customsearchappbar.dart';
import 'package:ecommerce_app_w/view/widget/items/categorieslist.dart';
import 'package:ecommerce_app_w/view/widget/items/gridviewitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class WdItems extends StatelessWidget {
  const WdItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ItemsControllerImp>(builder: (controller) {
            return ListView(
              children: [
                const CustomSearchAppBar(),
                const SizedBox(
                  height: 20,
                ),
                const CategoriesList(),
                const SizedBox(
                  height: 20,
                ),
                HandlingDataViewW(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        // mainAxisSpacing: 8,
                        crossAxisCount: 1,
                        childAspectRatio: 1.3,
                        // Adjusts the height to width ratio of each item
                      ),
                      shrinkWrap: true,
                      itemCount: controller.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Image.asset(AppImageAssets.sale),
                            InkWell(
                              onTap: (){controller.toShowItem(ItemsModel.fromJson(controller.items[index]));},
                              child: CustomGridViewItems(
                                  itemsModel:
                                      ItemsModel.fromJson(controller.items[index])),
                            ),
                          ],
                        );
                      }),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
