import 'package:get/get.dart';

abstract class ItemsController extends GetxController{
  changeSelectedCategory(int selectedCategory);
}


class ItemsControllerImp extends ItemsController{
  List categories =[];
  List items =[];
  int? selectedCategory ;
  @override
  void onInit() {
    super.onInit();
   categories = Get.arguments["categories"];
   items = Get.arguments["items"];
   selectedCategory = Get.arguments["selectedCategory"];
  }

  @override
  changeSelectedCategory(int selectedCategory) {
    this.selectedCategory = selectedCategory;
    update();
  }

}
