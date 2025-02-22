import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_w/controller/cart_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/cart_item.dart';
import 'package:ecommerce_app_w/view/widget/cart/cart_item_list.dart';
import 'package:ecommerce_app_w/view/widget/cart/place_order_button.dart';
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
        body: HandlingDataViewW(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                ...List.generate(controller.cartItems.length, (index) {
                  return SizedBox(
                    child: CartItemList(
                      cartItem: controller.cartItems[index],
                    ),
                  );
                }),
              ],
            )),
        bottomNavigationBar: const PlaceOrderButton(),
      );
    });
  }
}
