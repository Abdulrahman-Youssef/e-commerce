import 'package:ecommerce_app_w/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constant/color.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            headlineMedium:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , fontFamily: "PlayfairDisplay"),
            bodySmall:
                TextStyle(height: 3, color: AppColor.grey, fontSize: 18 , fontFamily: "PlayfairDisplay"),
          )),
      home: const OnBoarding(),
      routes: routes,
    );
  }
}
