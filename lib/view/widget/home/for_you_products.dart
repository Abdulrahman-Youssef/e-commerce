import 'package:ecommerce_app_w/controller/home_controller.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final HomeControllerImplementation controller;
  const ProductList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
        // padding: const EdgeInsets.symmetric(vertical: 5),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(color: Colors.red, ),
          color: Colors.white,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) => Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    spreadRadius: 5,
                    blurRadius: 2,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 70,
                  margin: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    "${AppImageAssets.rootImageItems}/${controller.items[index]["items_image"]}",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(
                    "${controller.items[index]["items_name"]}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

//
// Container(
// margin: const EdgeInsets.only(top: 7, left: 10),
// child: const Text(
// "products for you",
// style: TextStyle(
// fontSize: 20, fontWeight: FontWeight.bold),
// ),
// ),
