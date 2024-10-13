import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final String text ;
  final void Function()? onPressed;
  const CustomAuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      child: TextButton(

        onPressed: onPressed,
        style: TextButton.styleFrom(backgroundColor: AppColor.primaryColor,),
        child: Text(text),
      ),
    );
  }
}
