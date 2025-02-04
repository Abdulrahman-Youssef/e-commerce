import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../core/constant/color.dart';

Widget settingSearchBar(){
  return FloatingSearchBar(
    height: 35,
    hintStyle: const TextStyle(fontSize: 21),
    queryStyle: const TextStyle(fontSize: 18),
    backgroundColor: AppColor.primaryColor,
    borderRadius: BorderRadius.circular(18),
    actions: const [Icon(Icons.location_on)],
    builder: (BuildContext context, Animation<double> transition) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
              color: AppColor.primaryColor,
              elevation: 2.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: Colors.accents.map((color) {
                  return Container(height: 40, color: color);
                }).toList(),
              )));
    },
  );
}