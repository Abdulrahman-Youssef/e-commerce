import 'package:ecommerce_app_w/controller/checkout/choose_methodes_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/data/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressListTile extends StatelessWidget {
  final AddressModel address; // Address model
  final ChooseMethodControllerImpl controller;
  final IconData leadingIcon; // Leading icon
  final IconData trailingIcon; // Trailing icon

  const AddressListTile({
    super.key,
    required this.address,
    required this.controller,
    this.leadingIcon = Icons.location_on_sharp,
    this.trailingIcon = Icons.playlist_remove_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: (){controller.putSelectedAddress(address.addressId!);},
        selectedTileColor: AppColor.primaryColor,
        selectedColor: AppColor.navieHeadrsColor,
        selected: controller.selectedAddress == address.addressId,
        title: Text(
          address.addressName!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 22),
        ),
        subtitle: Text(
          "${address.addressCity}, ${address.addressStreet}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Icon(leadingIcon),
      ),
    );
  }
}
