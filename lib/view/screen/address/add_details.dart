import 'package:ecommerce_app_w/controller/address/add_details_controller.dart';
import 'package:ecommerce_app_w/controller/address/add_location_screen_controller.dart';
import 'package:ecommerce_app_w/view/widget/login/Authtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  AddAddressDetails({super.key});

  AddDetailsControllerImpl controllerImpl = Get.put(AddDetailsControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 250,
        height: 45,
        child: FloatingActionButton(
          onPressed: () {
            controllerImpl.addAddressDetails();
          },
          child: Text("Save Address"),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Address details"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AuthTextField(
                hinttext: "Address name",
                labeltext: "Address Name",
                iconData: Icons.ac_unit_sharp,
                mycontroller: controllerImpl.addressName,
                validator: (name) {},
                isNumber: false),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AuthTextField(
                hinttext: "Address city",
                labeltext: "Address city",
                iconData: Icons.edit_road_outlined,
                mycontroller: controllerImpl.city,
                validator: (name) {},
                isNumber: false),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AuthTextField(
                hinttext: "Address street",
                labeltext: "Address street",
                iconData: Icons.ac_unit_sharp,
                mycontroller: controllerImpl.street,
                validator: (name) {},
                isNumber: false),
          )
        ],
      )),
    );
  }
}
