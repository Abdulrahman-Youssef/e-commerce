  import 'package:ecommerce_app_w/controller/home_controller.dart';
  import 'package:ecommerce_app_w/controller/search_controller.dart';
  import 'package:ecommerce_app_w/core/constant/color.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';

  class CustomSearchAppBar extends StatelessWidget {
    const CustomSearchAppBar({super.key});

    @override
    Widget build(BuildContext context) {
      String searchWord1 = "";
      return Container(
        margin: const EdgeInsets.only(top: 0),
        child: Row(
          children: [
            Expanded(
              child:
                  GetBuilder<HomeControllerImplementation>(builder: (controller) {
                return TextFormField(
                  onChanged: (searchWord2) {
                    searchWord1 = searchWord2;
                    print(searchWord1);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: Container(
                        decoration: const BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        child: TextButton(
                          onPressed: () {
                            print("adad"+searchWord1);
                            controller.toSearchScreen("$searchWord1");
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                );
              }),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none))
          ],
        ),
      );
    }
  }
