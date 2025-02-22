import 'package:ecommerce_app_w/commen/widgets/button.dart';
import 'package:ecommerce_app_w/controller/checkout/choose_methodes_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/view/widget/address/address_screen/address_card.dart';
import 'package:ecommerce_app_w/view/widget/choose_methodes/address_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseMethodes extends StatelessWidget {
  ChooseMethodes({super.key});

  ChooseMethodControllerImpl controllerImpl =
      Get.put(ChooseMethodControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("choose methodes"),
        centerTitle: true,
      ),
      body: GetBuilder<ChooseMethodControllerImpl>(builder: (controller) {
        return HandlingDataViewW(
          statusRequest: controllerImpl.statusRequest,
          widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 8, top: 15, bottom: 10),
                    child: const Text(
                      "choose the payment method",
                      style:
                          TextStyle(color: AppColor.primaryColor, fontSize: 19),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      onTap: controller.choosePaymentCard,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      trailing: const Icon(Icons.swap_horizontal_circle),
                      minTileHeight: 20,
                      title: const Text(
                        "payment card",
                        style: TextStyle(fontSize: 18),
                      ),
                      selected: controllerImpl.paymentCard,
                      selectedColor: AppColor.navieHeadrsColor,
                      selectedTileColor: AppColor
                          .primaryColor, // Set to transparent to avoid conflicts
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      onTap: controller.chooseCash,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      trailing: const Icon(Icons.attach_money_outlined),
                      minTileHeight: 20,
                      title: const Text(
                        "Cash",
                        style: TextStyle(fontSize: 18),
                      ),
                      selected: controllerImpl.cash,
                      selectedColor: AppColor.navieHeadrsColor,
                      selectedTileColor: AppColor
                          .primaryColor, // Set to transparent to avoid conflicts
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 8, top: 15, bottom: 10),
                    child: const Text(
                      "choose the Shipping method",
                      style:
                          TextStyle(color: AppColor.primaryColor, fontSize: 19),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      onTap: controller.chooseDelivery,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      trailing: const Icon(Icons.motorcycle_outlined),
                      minTileHeight: 20,
                      title: const Text(
                        "Delivery",
                        style: TextStyle(fontSize: 18),
                      ),
                      selected: controllerImpl.delivery,
                      selectedColor: AppColor.navieHeadrsColor,
                      selectedTileColor: AppColor
                          .primaryColor, // Set to transparent to avoid conflicts
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      onTap: controller.choosePickup,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      trailing: const Icon(Icons.store),
                      minTileHeight: 20,
                      title: const Text(
                        "Pickup",
                        style: TextStyle(fontSize: 18),
                      ),
                      selected: controllerImpl.pickup,
                      selectedColor: AppColor.navieHeadrsColor,
                      selectedTileColor: AppColor
                          .primaryColor, // Set to transparent to avoid conflicts
                    ),
                  ),
                  if ( controller.delivery && controller.addressScreenController.addresses.isNotEmpty)
                    Container(
                        width: 300,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text("Your address"),
                            ...List.generate(controller.address.length,
                                (index) {
                              return AddressListTile(
                                address: controller.address[index],
                                controller: controller,
                              );
                            })
                          ],
                        ))
                ],
              )),
        );
      }),
      bottomNavigationBar: CommonButton(
        onPressed: () {},
        controller: controllerImpl,
        buttonText: "checkout",
      ),
    );
  }
}
