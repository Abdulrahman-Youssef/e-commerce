import 'package:ecommerce_app_w/core/class/statusRequest.dart';
import 'package:ecommerce_app_w/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAssets.loading1, width: 250 , height: 250,  ))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline1),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.serverError2),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                      child: Column(
                        children: [
                          Lottie.asset(AppImageAssets.noData1),
                          const Text("no data" , style: TextStyle(fontSize: 35),),
                        ],
                      ),
                    )
                    : widget;
  }
}
