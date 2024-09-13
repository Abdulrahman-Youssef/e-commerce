import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../data/datasource/static/static.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView.builder(
          itemCount: onBoaridingList.length,
          itemBuilder: (context, i) => Column(
                children: [
                  Text(
                    onBoaridingList[i].title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(onBoaridingList[i].image!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,),

                  Text(
                    onBoaridingList[i].body!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 3,
                      color: AppColor.grey
                    ),
                  )
                ],
              )),
    ));
  }
}
