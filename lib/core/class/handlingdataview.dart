import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: Text("loading"))
        : statusRequest == StatusRequest.offlineFailure
            ? const Center(
                child: Text("offline failure"),
              )
            : statusRequest == StatusRequest.serverFailure
                ? const Center(
                    child: Text("server failure"),
                  )
                : statusRequest == StatusRequest.failure
                    ? const Center(
                        child: Text("failure"),
                      )
                    : widget;
  }
}
