import 'package:ecommerce_app_w/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Billboard extends StatelessWidget {
  const Billboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(15),
        // Rounded corners for softer edges
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5), // Subtle shadow
            blurRadius: 10,
            offset: const Offset(-1, 5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today's OFFER",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.backgroundcolor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Cashback 10%",
                style: TextStyle(
                  fontSize: 18,
                  color:
                      Colors.white70,
                ),
              ),
            ],
          ),
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: AppColor.secondColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(45),
                // Keeps it circular
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.local_offer_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       padding: const EdgeInsets.only(left: 10, top: 10),
//       margin: const EdgeInsets.all(15),
//       decoration: const BoxDecoration(
//         color: AppColor.primaryColor,
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Today's OFFER", style: TextStyle(fontSize: 25),),
//               Text("cashback 10%", style: TextStyle(fontSize: 20),),
//             ],
//           ),
//           Positioned(
//             top: -10,
//             right: -10,
//             child: Container(
//               height: 80,
//               width: 80,
//               decoration: BoxDecoration(
//                   color: AppColor.secondColor,
//                   borderRadius: BorderRadius.circular(100)
//               ),
//
//             ),
//           )
//         ],
//       ));
//   }
// }
