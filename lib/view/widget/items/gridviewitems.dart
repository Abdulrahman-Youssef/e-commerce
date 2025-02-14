import 'package:ecommerce_app_w/controller/items_controller.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/ItemsCategoryView.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridViewItems extends StatelessWidget {
  final ItemsModel itemsModel;

  const CustomGridViewItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backgroundcolor,
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with slight border at the bottom
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border(
                bottom:
                    BorderSide(color: AppColor.grey.withOpacity(0.3), width: 2),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "${AppImageAssets.rootImageItems}/${itemsModel.itemsImage}",
                width: double.infinity,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Title Text with max lines and ellipsis
          Text(
            "${itemsModel.itemsName}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // Price and Favorite icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price: ${itemsModel.itemsPrice}\$",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontFamily: "sans", fontSize: 14),
              ),
              GetBuilder<ItemsControllerImp>(builder: (controller) {
                return IconButton(
                  onPressed: () {
                    controller.addToFavorite(itemsModel.itemsId!);
                    itemsModel.favorite = itemsModel.favorite == 1 ? 0 : 1 ;
                  },
                  icon: itemsModel.favorite != null && itemsModel.favorite == 0  ? const Icon(Icons.favorite_outline) : const Icon(Icons.favorite) ,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
