import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(AppImageAssets.logo),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(flex: 3  , child: Container(
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name : the new logo is here" , maxLines: 1, overflow: TextOverflow.ellipsis,),
                                Divider(color: Colors.transparent,),
                                Text("Price: 20\$"),
                              ],
                            ),
                          )),
                          Expanded(flex: 1  , child: Container(
                            child: Column(
                              children: [
                                IconButton(onPressed: (){} , icon: const Icon(Icons.add),),
                                const Text("2"),
                                IconButton(onPressed: (){} , icon: const Icon(Icons.remove),),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
