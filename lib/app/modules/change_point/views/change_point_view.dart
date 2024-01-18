import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/widgets/redeemMenu.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

import '../controllers/change_point_controller.dart';

class ChangePointView extends GetView<ChangePointController> {
  ChangePointView({Key? key}) : super(key: key);
  final ChangePointController _controller = Get.put(ChangePointController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(AlertDialog(
        title: const Text('Selamat datang di penukaran poin'),
        content: const Text(
            "1 Poin bernilai 1 Rupiah, proses penukaran poin akan memakan waktu 1-3 hari kerja."),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ));
    });
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(34, 193, 195, 1),
                Color.fromRGBO(95, 253, 45, 0.74)
              ],
            ),
          ),
        ),
        actions: [
          Obx(() {
            if (_controller.userData.value != null) {
              var user = _controller.userData.value!;
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 45,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(50, 20))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.point.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('Poin',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              );
            } else {
              // If user data is not available, display a loading indicator or placeholder
              return const CircularProgressIndicator();
            }
          })
        ],
      ),
      body: ListView(
        children: [
          verticalSpace(20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                RedeemMenu(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
