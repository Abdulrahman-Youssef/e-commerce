import 'package:flutter/material.dart';

import 'color.dart';

class CustomTextTheme {
  static TextTheme textTheme1 =const TextTheme(
    //appbar title
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        ),
    titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
        ),
    titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        ),
    headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        ),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        ),
    headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        ),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        ),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        ),
    bodySmall: TextStyle(
        height: 3,
        color: AppColor.grey,
        fontSize: 15,
        ),
  );


}