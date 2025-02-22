import 'package:ecommerce_app_w/controller/items_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CategoriesList extends StatelessWidget {

  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GetBuilder<ItemsControllerImp>(
          builder: (controller) {
            return Container(
              height: 120,
              decoration: BoxDecoration(
                color: AppColor.backgroundcolor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      controller.changeSelectedCategory(index) ;
                      // controller.goToItems(controller.categories, index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        color: controller.selectedCategory != index ? Colors.white : AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "${AppImageAssets.rootImageCategories}/${controller.categories[index]["categories_image"]}",
                        fit: BoxFit.contain,
                        width: 50,
                        height: 50, // Set consistent width and height for images
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 12); // Space between items for better spacing
                },
              ),
            );
          }
        );
      }
    );
  }
}
