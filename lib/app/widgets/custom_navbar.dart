import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/modules/camera/bindings/camera_binding.dart';
import 'package:snapclean/app/modules/camera/views/camera_view.dart';
import 'package:snapclean/app/modules/history/bindings/history_binding.dart';
import 'package:snapclean/app/modules/history/views/history_view.dart';
import 'package:snapclean/app/modules/home/bindings/home_binding.dart';
import 'package:snapclean/app/modules/home/views/home_view.dart';
import 'package:snapclean/app/modules/profile/bindings/profile_binding.dart';
import 'package:snapclean/app/modules/profile/views/profile_view.dart';
import 'package:snapclean/app/modules/reward/bindings/reward_binding.dart';
import 'package:snapclean/app/modules/reward/views/reward_view.dart';

class NavController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.off(HomeView(), binding: HomeBinding());
        break;
      case 1:
        Get.off(
            HistoryView(
              initialTabIndex: 0,
            ),
            binding: HistoryBinding());
        break;
      case 2:
        Get.off(CameraView(), binding: CameraBinding());
        break;
      case 3:
        Get.off(const RewardView(), binding: RewardBinding());
        break;
      case 4:
        Get.off(const ProfileView(), binding: ProfileBinding());
    }
  }
}

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavController());
    final NavController navController = Get.find<NavController>();
    return Obx(() {
      return ConvexAppBar(
        items: [
          TabItem(
              icon: Icon(Icons.home_outlined,
                  color: navController.currentIndex.value == 0
                      ? Colors.green
                      : Colors.white)),
          TabItem(
              icon: Icon(Icons.history_outlined,
                  color: navController.currentIndex.value == 1
                      ? Colors.green
                      : Colors.white)),
          TabItem(
              icon: Icon(Icons.camera_alt_outlined,
                  color: navController.currentIndex.value == 2
                      ? Colors.green
                      : Colors.white)),
          TabItem(
              icon: Icon(Icons.card_giftcard_outlined,
                  color: navController.currentIndex.value == 3
                      ? Colors.green
                      : Colors.white)),
          TabItem(
              icon: Icon(Icons.person_outlined,
                  color: navController.currentIndex.value == 4
                      ? Colors.green
                      : Colors.white)),
        ],
        style: TabStyle.fixedCircle,
        initialActiveIndex: navController.currentIndex.value,
        onTap: navController.changePage,
        backgroundColor: Colors.grey,
      );
    });
  }
}
