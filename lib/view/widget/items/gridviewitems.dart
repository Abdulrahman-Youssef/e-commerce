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
    TextDecoration te = TextDecoration.none;
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
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "${AppImageAssets.rootImageItems}/${itemsModel.itemsImage}",
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                if (itemsModel.itemsDiscount! > 0)
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Image.asset(
                        AppImageAssets.sale,
                        height: 35,
                      ))
              ],
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
          if (itemsModel.itemsDiscount! > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Original Price with Strikethrough
                Text(
                  "\$${itemsModel.itemsPrice}",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 2,
                  ),
                ),
                const SizedBox(width: 8), // Spacing between prices
                // Discounted Price in Bold Red
                Text(
                  "\$${(itemsModel.itemsPrice! - (itemsModel.itemsPrice! * (itemsModel.itemsDiscount! / 100))).toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 5),
// Discount Badges
          if(itemsModel.itemsDiscount! > 0 )
          Row(
            children: [
              // First Order Offer Badge
              const SizedBox(width: 5),
              // Percentage Discount Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "${itemsModel.itemsDiscount}% OFF",
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          if (itemsModel.itemsDiscount! <= 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${itemsModel.itemsPrice}",
                  style: const TextStyle(
                    decorationThickness: 5,
                  ),
                ),
              ],
            ),
          GetBuilder<ItemsControllerImp>(builder: (controller) {
            return IconButton(
              onPressed: () {
                controller.addToFavorite(itemsModel.itemsId!);
                itemsModel.favorite = itemsModel.favorite == 1 ? 0 : 1;
              },
              icon: itemsModel.favorite != null && itemsModel.favorite == 0
                  ? const Icon(Icons.favorite_outline)
                  : const Icon(Icons.favorite),
            );
          }),
        ],
      ),
    );
  }
}
