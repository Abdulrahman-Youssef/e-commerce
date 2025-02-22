import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';
import 'package:http/http.dart';

class HomeData {
  late Crud curd;

  HomeData(this.curd);

  postData() async {
    var response = await curd.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
