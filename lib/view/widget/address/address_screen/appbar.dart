import 'package:flutter/material.dart';

class AddressAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AddressAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "Your Address",
        textAlign: TextAlign.center, // Optional, since AppBar usually centers text
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
