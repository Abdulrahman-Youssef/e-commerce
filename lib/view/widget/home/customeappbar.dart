import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
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
                      onPressed: () {},
                      child: const Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                  )),
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
    );
  }
}
