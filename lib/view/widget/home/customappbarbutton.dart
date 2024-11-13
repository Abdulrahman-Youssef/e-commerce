import 'package:ecommerce_app_w/controller/homescreen_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppbarButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData icon;
   bool selected ;

   CustomAppbarButton(
      {super.key,
      this.onPressed,
      required this.text,
      required this.icon,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            color: selected == true ? AppColor.primaryColor : AppColor.black,
            icon,
            size: 25,
          ),
          Text(
            text,
            style: TextStyle(
              color: selected == true ? AppColor.primaryColor : AppColor.black,
            ),
          )
        ],
      ),
    );
  }
}
