import 'package:ecommerce_app_w/controller/favorite_controller.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  final FavoriteControllerImp controller = Get.put(FavoriteControllerImp());

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Items"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return Center(
            child: Text(
              "No items in your favorites yet!",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            ItemsModel item = ItemsModel.fromJson(controller.favorites[index]);
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: ListTile(
                leading: SizedBox(
                  width: 50, // Constrain the width
                  height: 50, // Constrain the height
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "${AppImageAssets.rootImageItems}/${item.itemsImage}",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  item.itemsName!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "\$${item.itemsPrice}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    controller.removeFromFavorites(item.itemsId!);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
