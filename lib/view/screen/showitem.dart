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
        body: GetBuilder<ShowItemsControllerImpl>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ItemImage(
                  item: controller.item,
                ),
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
                if (controller.item.itemsDiscount! > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Original Price with Strikethrough
                      const Text(
                        "Price:",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "\$${controller.item.itemsPrice}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2,
                        ),
                      ),
                      const SizedBox(width: 8), // Spacing between prices
                      // Discounted Price in Bold Red
                      Text(
                        "\$${(controller.item.itemsPrice! - (controller.item.itemsPrice! * (controller.item.itemsDiscount! / 100))).toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (controller.item.itemsDiscount! <= 0)
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
        bottomNavigationBar: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
          ),
          child: GetBuilder<ShowItemsControllerImpl>(builder: (controller) {
            return TextButton(
                onPressed: () {
                  controller.putItemToCard(controller.item.itemsId!);
                },
                child: const Text("Add to card"));
          }),
        ),
      ),
    );
  }
}
