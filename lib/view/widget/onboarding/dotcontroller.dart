import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/datasource/static/static.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            onBoaridingList.length,
            (index) => AnimatedContainer(
                  margin: const EdgeInsets.all(5),
                  duration: const Duration(milliseconds: 900),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10)),
                )),
      ],
    );
  }
}
