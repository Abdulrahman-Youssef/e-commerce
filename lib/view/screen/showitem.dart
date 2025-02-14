import 'package:ecommerce_app_w/controller/showitems_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/view/widget/showitem/itemcolors.dart';
import 'package:ecommerce_app_w/view/widget/showitem/itemimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowItem extends StatelessWidget {
  const ShowItem({super.key});
  //missing good management for Colors and rating
  @override
  Widget build(BuildContext context) {
    Get.put(ShowItemsControllerImpl());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
          ),
          child: GetBuilder<ShowItemsControllerImpl>(
            builder: (controller) {
              return TextButton(onPressed: () {
                    controller.putItemToCard(controller.item.itemsId!);

              }, child: const Text("Add to card"));
            }
          ),
        ),
        body: GetBuilder<ShowItemsControllerImpl>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ItemImage(item: controller.item,),
                Text(
                  "${controller.item.itemsName}",
                  style: const TextStyle(
                    color: AppColor.navieHeadrsColor,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Price: ${controller.item.itemsPrice}\$",
                  style: const TextStyle(
                    fontFamily: "sans",
                    fontSize: 20,
                    color: AppColor.black,
                  ),
                ),
                // temporarily until itemColors work
                const Text(
                  "colors: red white blue",
                  style: TextStyle(
                    fontFamily: "sans",
                    fontSize: 17,
                    color: AppColor.black,
                  ),
                ),
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${controller.item.itemsDescription}",
                  style:
                      const TextStyle(color: AppColor.bodyColor2, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                // const Text(
                //   "colors",
                //   style: TextStyle(
                //       fontSize: 23,
                //       fontWeight: FontWeight.bold,
                //       color: AppColor.navieHeadrsColor),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),

                //until data base adjusting
                // ItemColors(item: controller.item,),
              ],
            ),
          );
        }),
      ),
    );
  }
}
