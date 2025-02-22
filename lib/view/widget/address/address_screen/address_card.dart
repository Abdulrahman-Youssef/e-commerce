import 'package:ecommerce_app_w/data/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address; // Address model
  final VoidCallback onRemovePressed; // Callback for the remove button
  final IconData leadingIcon; // Leading icon
  final IconData trailingIcon; // Trailing icon

  const AddressCard({
    super.key,
    required this.address,
    required this.onRemovePressed,
    this.leadingIcon = Icons.location_on_sharp, // Default leading icon
    this.trailingIcon = Icons.playlist_remove_outlined, // Default trailing icon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
        trailing: IconButton(
          icon: Icon(trailingIcon),
          onPressed: onRemovePressed,
        ),
      ),
    );
  }
}