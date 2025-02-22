import 'package:flutter/material.dart';

class SettingSearchBar extends StatelessWidget {
  const SettingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
