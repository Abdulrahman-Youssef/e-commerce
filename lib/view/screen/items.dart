import 'package:ecommerce_app_w/controller/items_controller.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/view/widget/gloablewidgets/ScrollableCategoryGallery.dart';
import 'package:ecommerce_app_w/view/widget/gloablewidgets/customsearchappbar.dart';
import 'package:ecommerce_app_w/view/widget/items/categories.dart';
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
          return Container(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 0,
                    crossAxisCount: 2,
                    childAspectRatio:
                        .9, // Adjusts the height to width ratio of each item
                  ),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image container
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            // Rounded corners
                            child: Image.asset(
                              "${AppImageAssets.rootImageItems}/${controller.items[index]["items_image"]}",
                              width: double.infinity,
                              height: 100, // Adjust as needed
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Title Text with max lines and ellipsis
                          Text(
                            "${controller.items[index]["items_name"]}",
                            maxLines: 2,
                            // Limit to 2 lines
                            overflow: TextOverflow.ellipsis,
                            // Adds "..." if text is too long
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          const SizedBox(height: 4),

                          // Price and Favorite icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price: ${controller.items[index]["items_price"]} \$",
                                style: const TextStyle(
                                    fontFamily: "sans", fontSize: 14),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

// GridView.builder(
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisSpacing: 3,
// mainAxisSpacing: 0,
// crossAxisCount: 2,
// ),
// shrinkWrap: true,
// itemCount: controller.items.length,
// itemBuilder: (BuildContext context, int index) {
// // items cards
// return Container(
// // color: Colors.black,
// margin: const EdgeInsets.symmetric(
// vertical: 0,
// ),
// child: Column(
// children: [
// Image.asset(
// "${AppImageAssets.rootImageItems}/${controller.items[index]["items_image"]}",
// width: 140,
// ),
// Text("${controller.items[index]["items_name"]}"),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "price : ${controller.items[index]["items_price"]} \$",
// style: const TextStyle(fontFamily: "sans"),
// ),
// IconButton(
// onPressed: () {},
// icon: const Icon(Icons.favorite_border))
// ],
// ),
// ],
// ));
// },
// )
