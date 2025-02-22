import 'package:badges/badges.dart';
import 'package:ecommerce_app_w/controller/address/add_location_screen_controller.dart';
import 'package:ecommerce_app_w/core/class/handlingdataviewW.dart';
import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart'; // Use latlong2 package for LatLng
import 'package:url_launcher/url_launcher_string.dart';

class AddLocationScreen extends StatelessWidget {
  AddLocationScreen({super.key});

  AddLocationScreenControllerImpl controllerImpl =
      Get.put(AddLocationScreenControllerImpl());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
            width: 200,
            height: 40,
            child: FloatingActionButton(
              onPressed: () {
                if(controllerImpl.markers.isNotEmpty){
                  controllerImpl.toAddAddressDetails();
                }
              },
              shape: const RoundedRectangleBorder(),
              child: const Text("continue"),
            )),
        body:
            GetBuilder<AddLocationScreenControllerImpl>(builder: (controller) {
          return HandlingDataViewW(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    onTap: (tapLocation, LatLng) {
                      controller.addMarker(LatLng);
                    },
                    initialCenter: controller.currentLocation != null
                        ? LatLng(
                            controller.currentLocation!.latitude!,
                            controller.currentLocation!.longitude!,
                          )
                        : const LatLng(0, 0),
                    // Center the map over London
                    initialZoom: 9.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: controller.markers,
                    ),
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => launchUrlString(
                              'https://openstreetmap.org/copyright'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
