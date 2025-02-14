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
    Get.put(
        CartControllerImpl()); //  you have to put the controller so getBuilder can find it
    return GetBuilder<CartControllerImpl>(builder: (controller) {
      return Scaffold(
          backgroundColor: AppColor.backgroundcolor,
          appBar: AppBar(
            title: const Center(
                child: Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          body: ListView(
            children: [
              ...List.generate(controller.cartItems.length, (index) {
                return SizedBox(
                  // height: ,
                  child: CartItemList(
                    cartItem:
                        controller.cartItems[index],
                  ),
                );
              }),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Total price",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("2300 \$"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          AppColor.primaryColor)),
                  child: const SizedBox(
                    width: 280,
                    child: Center(
                      child: Text(
                        "Place order",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
    });
  }
}
