import 'package:ecommerce_app_w/core/constant/texttheme.dart';
import 'package:ecommerce_app_w/localization/changelocale.dart';
import 'package:ecommerce_app_w/localization/translation.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:ecommerce_app_w/view/screen/language.dart';
import 'package:ecommerce_app_w/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constant/color.dart';
import 'routes.dart';
import 'view/screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
          primarySwatch: Colors.green,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: cutomeTheme.textTheme1),
      home: const Login(),
      routes: routes,
    );
  }
}
