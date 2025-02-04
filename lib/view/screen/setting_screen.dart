import 'package:ecommerce_app_w/controller/setting_controller.dart';
import 'package:ecommerce_app_w/core/constant/sharedprefkeys.dart';
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
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Search..."),
                ],
              ),
            ),
            ..._buildSettingMenuTiles(context)
          ],
        ));
  }

  List<Widget> _buildSettingMenuTiles(BuildContext context) {
    return [
      ListTile(
        leading: const Icon(Icons.exit_to_app_outlined),
        title: const Text("Logout"),
        onTap: () async {
          final result = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirm'),
                content: const Text('Do you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          if (result == true) {
            controller.logout(result == true);
          }
        },
      ),
      const ListTile(
        leading: Icon(Icons.person_outline),
        title: Text("Profile"),
      ),
      GetBuilder<SettingControllerImpl>(builder: (context) {
        bool not = true;
        return ListTile(
          leading: Icon(Icons.notifications_on_outlined),
          trailing: Switch(
            value: not,
            onChanged: (bool value) {
              print("$value + $not");
              not = !not;
            },
          ),
          title: const Text("Notification"),
        );
      }),
      const ListTile(
        leading: Icon(Icons.help_outline_rounded),
        title: Text("about us"),
      ),
    ];
  }
}
