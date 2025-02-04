import 'package:ecommerce_app_w/core/constant/apptheme.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedpref.setString(AppSharedPrefKeys.lang, langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);

  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedpref.getString("lang");

    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme =themeEnglish;
    }
    super.onInit();
  }
}
