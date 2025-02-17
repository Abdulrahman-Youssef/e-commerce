import 'package:ecommerce_app_w/controller/cart_controller.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/cart_item.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemList extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemList({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImpl>(builder: (controller) {
      return Card(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                "${AppImageAssets.rootImageItems}/${cartItem.itemsImage!}",
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "${cartItem.itemsName}",
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.transparent,
                          ),
                          if(cartItem.itemsDiscount! > 0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Original Price with Strikethrough
                                Text(
                                  "\$${cartItem.itemsPrice}",
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
                                  "\$${(cartItem.itemsPrice! - (cartItem.itemsPrice! * (cartItem.itemsDiscount! / 100))).toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          if(cartItem.itemsDiscount! <= 0)
                          Text("Price: ${cartItem.itemsPrice} \$"),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                cartItem.itemCount = cartItem.itemCount! + 1;
                                controller.putItem(
                                    cartItem.itemsId!, cartItem.itemCount!);
                              },
                              icon: const Icon(Icons.add),
                            ),
                            Text("${cartItem.itemCount}"),
                            IconButton(
                              onPressed: () {
                                cartItem.itemCount = cartItem.itemCount! - 1;
                                controller.removeItem(
                                    cartItem.cartID!, cartItem.itemCount!);
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
