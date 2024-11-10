import 'package:ecommerce_app_w/controller/home_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class ScrollableCategoryGallery extends StatelessWidget {
 final HomeControllerImplementation controller;
  const ScrollableCategoryGallery({super.key , required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Slightly taller to give space for rounded borders and padding
      decoration: BoxDecoration(
        color: AppColor.backgroundcolor.withOpacity(0.9), // Light, relaxing background color
        borderRadius: BorderRadius.circular(15), // Rounded corners for outer container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Soft shadow for depth
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10), // Add vertical padding
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8), // Padding inside each item for breathing room
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white, // Light background for item containers
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // Subtle shadow for each item
                ),
              ],
            ),
            child: Image.asset(
              "${AppImageAssets.rootImageCategories}/${controller.categories[index]["categories_image"]}",
              fit: BoxFit.contain,
              width: 50,
              height: 50, // Set consistent width and height for images
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12); // Space between items for better spacing
        },
      ),
    );

  }
}




// Container(
// height: 100,
// decoration: BoxDecoration(
// color: AppColor.backgroundcolor,
// // border: Border.all(color: Colors.blue)
// ),
// child: ListView.separated(
// scrollDirection: Axis.horizontal,
// // itemCount: controller.categories.length,
// itemCount: controller.categories.length,
// itemBuilder: (context, index) {
// return Container(
// margin: const EdgeInsets.symmetric(
// vertical: 30, horizontal: 10),
// decoration: BoxDecoration(
// color: AppColor.backgroundcolor,
// ),
// child: Image.asset(
// width: 50,
// "${AppImageAssets.rootImageCategories}/${controller.categories[index]["categories_image"]}",
// fit: BoxFit.contain,
// // Adjust the fit if necessary
// ));
// },
// separatorBuilder: (BuildContext context, int index) {
// return const SizedBox(width: 10);
// },
// ),
// )