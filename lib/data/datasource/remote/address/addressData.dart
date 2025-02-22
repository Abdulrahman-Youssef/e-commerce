import 'package:ecommerce_app_w/core/class/crud.dart';
import 'package:ecommerce_app_w/linkapi.dart';

class AddressData {
  late Crud crud;

  AddressData(this.crud);

  getData(String userID) async {
    var response = await crud.postData(AppLink.addressView, {
      "user_id": userID,
    });
    return response.fold((l) => l, (r) => r); //?
  }

  addAddress(String userID, String addressName, String city, String street,
      String long, String lat) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "userid": userID,
      "addressName": addressName,
      "street": street,
      "city": city,
      "long": long,
      "lat": lat,
    });
    return response.fold((l) => l, (r) => r); //?
  }

  updateAddress(String addressID, String addressName, String city, String street,
      String long, String lat) async {
    var response = await crud.postData(AppLink.addressUpdate, {
      "address_id": addressID,
      "addressName": addressName,
      "street": street,
      "city": city,
      "long": long,
      "lat": lat,
    });
    return response.fold((l) => l, (r) => r); //?
  }


  removeAddress(String addressID) async {
    var response = await crud.postData(AppLink.addressRemove, {
      "address_id": addressID,
    });
    return response.fold((l) => l, (r) => r); //?
  }



}
