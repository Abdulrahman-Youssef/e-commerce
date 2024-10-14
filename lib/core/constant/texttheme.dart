import 'package:flutter/material.dart';

import 'color.dart';

class CustomTheme {
  static TextTheme textTheme1 =const TextTheme(
    //appbar title
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: "PlayfairDisplay"),
    titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
        fontFamily: "PlayfairDisplay"),
    titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "PlayfairDisplay"),
    headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: "PlayfairDisplay"),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "PlayfairDisplay"),
    headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: "PlayfairDisplay"),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "PlayfairDisplay"),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        fontFamily: "PlayfairDisplay"),
    bodySmall: TextStyle(
        height: 3,
        color: AppColor.grey,
        fontSize: 15,
        fontFamily: "PlayfairDisplay"),
  );
}