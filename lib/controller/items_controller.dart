import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/function/handlingdatacontroller.dart';
import 'package:ecommerce_app_w/data/datasource/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();

  changeSelectedCategory(int selectedCategory);

  getItems();

  addToFavorite();

}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsData = ItemsData(Get.find());

  Icon favoriteIcon = const Icon(Icons.favorite_border);

  // bool isFavorite = false;
  List categories = [];
  List items = [];
  int? selectedCategory;

  late StatusRequest statusRequest;

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    // print("selected category  is : ${selectedCategory!}");
    // print("selected category sended is : ${categories[selectedCategory!]["categories_id"]}");
    var response = await itemsData.getData(categories[selectedCategory!]["categories_id"].toString());
    print("items response :  $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {

        items.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initialData();
    getItems();
   }

  @override
  void changeSelectedCategory(int selectedCategory) {
    this.selectedCategory = selectedCategory;
    // to clear the items to not stack
    items.clear();
    getItems();
    update();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    // isn't that better replacing another request to data base (getItems)
    // items = Get.arguments["items"];
    selectedCategory = Get.arguments["selectedCategory"];
  }

  @override
  void addToFavorite() {
    changeFavoriteIcon();
    update();
  }


  void changeFavoriteIcon(){
    favoriteIcon = favoriteIcon == const Icon(Icons.favorite_border) ? const Icon(Icons.favorite) :  const Icon(Icons.favorite_border)  ;
    update();
  }


}
