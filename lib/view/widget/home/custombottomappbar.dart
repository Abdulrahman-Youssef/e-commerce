import 'package:ecommerce_app_w/controller/homescreen_controller.dart';
import 'package:ecommerce_app_w/view/widget/home/customappbarbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(controller.page.length, (index) {
                    return index == 2
                        ? Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              CustomAppbarButton(
                                text: "favorite",
                                icon: CupertinoIcons.heart,
                                selected: controller.currentPage == index,
                                onPressed: () {
                                  controller.changePage(index);
                                },
                              ),
                            ],
                          )
                        : CustomAppbarButton(
                            text: controller.pageName["pageName"]?[index],
                            icon: controller.pageName["icons"]?[index],
                            // icon: Icons.home,
                            selected:
                                controller.currentPage == index ? true : false,
                            onPressed: () {
                              controller.changePage(index);
                            },
                          );
                  })
                ],
              ),
            ));
  }
}
