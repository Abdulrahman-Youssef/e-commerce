import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class CommonButton<T extends GetxController> extends StatelessWidget {
  final T controller; // The controller to be used
  final VoidCallback onPressed; // Callback for the button press
  final String buttonText; // Text for the button
  final Color buttonColor; // Background color of the button
  final Color textColor; // Text color of the button

  const CommonButton({
    super.key,
    required this.controller,
    required this.onPressed,
    this.buttonText = "Place order", // Default button text
    this.buttonColor = AppColor.primaryColor, // Default button color
    this.textColor = Colors.white, // Default text color
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: controller, // Initialize the controller
      builder: (controller) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(buttonColor),
                minimumSize: WidgetStateProperty.all<Size>(
                  const Size(double.infinity, 50),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}