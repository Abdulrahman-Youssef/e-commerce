import 'package:ecommerce_app_w/core/constant/appfontfamilies.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/texttheme.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
      fontFamily: AppFontFamilies.playfairDisplay,
    primarySwatch: Colors.green,
    primaryColor: AppColor.primaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: CustomTextTheme.textTheme1);

ThemeData themeArabic = ThemeData(
  fontFamily: AppFontFamilies.cairo,
    primarySwatch: Colors.green,
    primaryColor: AppColor.primaryColor,

    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: CustomTextTheme.textTheme1);
