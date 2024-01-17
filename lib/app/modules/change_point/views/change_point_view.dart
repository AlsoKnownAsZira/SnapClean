import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:snapclean/app/widgets/redeemMenu.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

import '../controllers/change_point_controller.dart';

class ChangePointView extends GetView<ChangePointController> {
  const ChangePointView({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60)),
              child: const Center(
                child: Text(
                  "420 Poin",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
