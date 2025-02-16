import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_w/controller/cart_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/cart_item.dart';
import 'package:ecommerce_app_w/view/widget/cart/cart_item_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImpl()); // Initialize the controller
    return GetBuilder<CartControllerImpl>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Obx(() {
          if (controller.cartItems.isEmpty) {
            return Center(
              child: Text(
                "No items in your cart yet!",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            );
          }
          return ListView(
            children: [
              ...List.generate(controller.cartItems.length, (index) {
                return SizedBox(
                  child: CartItemList(
                    cartItem: controller.cartItems[index],
                  ),
                );
              }),
            ],
          );
        }),
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total price",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${controller.totalPrice} \$",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextButton(
                  onPressed: () {
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        AppColor.primaryColor),
                    minimumSize: WidgetStateProperty.all<Size>(
                        const Size(double.infinity, 50)),
                  ),
                  child: const Text(
                    "Place order",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}