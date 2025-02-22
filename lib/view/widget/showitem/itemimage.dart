import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final ItemsModel item;

  const ItemImage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
              bottom: BorderSide(color: AppColor.greyBorderColor, width: 3),
              top: BorderSide(color: AppColor.greyBorderColor, width: 3))),
      child: Image.asset(
        width: double.infinity,
        height: 100,
        fit: BoxFit.fitHeight,
        "${AppImageAssets.rootImageItems}/${item.itemsImage}",
      ),
    );
  }
}
