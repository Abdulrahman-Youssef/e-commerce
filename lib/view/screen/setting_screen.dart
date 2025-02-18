import 'package:ecommerce_app_w/controller/setting_controller.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
import 'package:ecommerce_app_w/view/widget/setting/address_button.dart';
import 'package:ecommerce_app_w/view/widget/setting/logout_button.dart';
import 'package:ecommerce_app_w/view/widget/setting/notification_switch.dart';
import 'package:ecommerce_app_w/view/widget/setting/setting_search_bar.dart';
import 'package:ecommerce_app_w/view/widget/setting/setting_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  SettingControllerImpl controller = Get.put(SettingControllerImpl());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Center(
              child: Text(
            "Setting",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ),
        body: ListView(
          children: const [
            // search in the setting options
            SettingSearchBar(),
            LogoutButton(),
            AddressButton(),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("Profile"),
            ),
            NotificationSwitch(),
            ListTile(
              leading: Icon(Icons.help_outline_rounded),
              title: Text("about us"),
            ),
          ],
        ));
  }
}
