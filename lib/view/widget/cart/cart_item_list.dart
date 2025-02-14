import 'package:ecommerce_app_w/controller/cart_controller.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/cart_item.dart';
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
