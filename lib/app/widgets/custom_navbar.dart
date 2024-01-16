import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../routes/app_pages.dart';

class CustomNavbar extends StatelessWidget {
  final int initialActiveIndex;

  CustomNavbar({this.initialActiveIndex = 0});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      
      items: const [
        TabItem(icon: Icons.home),
        TabItem(icon: Icons.history),
        TabItem(icon: Icons.camera_alt_outlined, ),
        TabItem(icon: Icons.card_giftcard_outlined, ),
        TabItem(icon: Icons.person_2_outlined, ),

      ],
      activeColor: Colors.green,
      color: Colors.grey,
    
      initialActiveIndex: initialActiveIndex,
      onTap: (index) {
        switch (index){
          case 0:
            Get.offAllNamed(Routes.HOME);
            break;
          case 1:
            Get.offAllNamed(Routes.HISTORY);
            break;
          case 2:
            Get.offAllNamed(Routes.CAMERA);
            break;
          case 3:
            Get.offAllNamed(Routes.REWARD);
            break;
          case 4:
            Get.offAllNamed(Routes.PROFILE);
            break;
        }
      },
    );
  }
}
