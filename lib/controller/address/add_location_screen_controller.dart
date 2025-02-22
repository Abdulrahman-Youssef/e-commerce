import 'dart:async';
import 'dart:convert';
import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/approutes.dart';
import 'package:ecommerce_app_w/data/datasource/remote/address/addressData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class AddLocationScreenControllerImpl extends GetxController {
  late MapController mapController;
  LocationData? currentLocation = null;
  // late List<LatLng> routePoints = [];
  late List<Marker> markers = [];
  late final Location _location;
  final String orsApiKey =
      '5b3ce3597851110001cf6248eda83cb469e54396a870dbc8432eb97c';


  late StatusRequest statusRequest = StatusRequest.loading;
  // AddressData addressData = AddressData(Get.find());


  @override
  void onInit() async {
    super.onInit();

    _location = Location();
    await getCurrentLocation();
  }

  getCurrentLocation() async {
    statusRequest = StatusRequest.loading;

    currentLocation = await _location.getLocation();
    statusRequest = StatusRequest.success;
    update();
  }

  addMarker(LatLng latlang) {
    markers.clear();
    // print("markers");
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: latlang,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
      ),
    );
    update();
  }


    toAddAddressDetails(){
    Get.toNamed(AppRoutes.addAddressDetails , arguments: { "lat" : markers[0].point.latitude ,"long" : markers[0].point.longitude });
      update();
    }










}
