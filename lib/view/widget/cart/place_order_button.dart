import 'package:ecommerce_app_w/controller/cart_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImpl>(
      builder: (controller) {
        return SafeArea(
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
                  onPressed: controller.toChooseMethodes,
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
        );
      }
    );
  }
}
