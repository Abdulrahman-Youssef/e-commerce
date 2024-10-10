import 'package:ecommerce_app_w/core/constant/appfont.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText  ;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed:onPressed,
        color: AppColor.primaryColor,
        child:  Text(
          buttonText,
          style:const TextStyle(
              fontFamily: AppFont.cairo,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }
}
