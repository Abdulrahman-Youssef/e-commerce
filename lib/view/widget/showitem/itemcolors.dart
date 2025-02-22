import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

class ItemColors extends StatelessWidget {
  // not used yet
  final ItemsModel item ;
  const ItemColors({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          4,
              (index) => Container(
            alignment: Alignment.center,
            height: 60,
            width: 55,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: AppColor.greyBorderColor, width: 3)
              // color: Colors.red,
            ),
            child: const Text("red"),
          ),
        )
      ],
    );
  }
}
