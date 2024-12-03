import 'package:ecommerce_app_w/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ShowItemsController extends GetxController {



}

class ShowItemsControllerImpl extends ShowItemsController {
 late  ItemsModel item;
  initData(){
    item = Get.arguments["item"];
  }



  @override
  void onInit() {
    super.onInit();
    initData();
  }
}