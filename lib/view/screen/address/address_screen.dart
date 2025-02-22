import 'package:ecommerce_app_w/controller/address/address_screen_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/view/widget/address/address_screen/address_card.dart';
import 'package:ecommerce_app_w/view/widget/address/address_screen/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  AddressScreenControllerImpl controllerImpl =
      Get.put(AddressScreenControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButtonLocation: ,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          shape: const CircleBorder(),
          onPressed: () {
            controllerImpl.toAddLocationScreen();
          },
          child: const Icon(Icons.add),
        ),
        appBar: const AddressAppbar(),
        body: GetBuilder<AddressScreenControllerImpl>(builder: (controller) {
          return HandlingDataViewW(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                ...List.generate(controller.addresses.length, (index) {
                  return AddressCard(
                      address: controller.addresses[index],
                      onRemovePressed: () {
                        controller.removeAddress(
                          controller.addresses[index].addressId!,
                        );
                      }

                      );
                })
              ]));
        }));
  }
}




//   Card(
//   child: ListTile(
//     title: Text(
//       "${controller.addresses[index].addressName}",
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//       style: const TextStyle(fontSize: 22),
//     ),
//     subtitle: Text(
//       "${controller.addresses[index].addressCity} , ${controller.addresses[index].addressStreet} ",
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     ),
//     leading: const Icon(Icons.location_on_sharp),
//     trailing: IconButton(
//       icon: const Icon(Icons.playlist_remove_outlined),
//       onPressed: () {
//         controller.removeAddress(
//             controller.addresses[index].addressId!);
//         },
//     ),
//   ),
// );