import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';
import 'package:snapclean/app/widgets/gradient_appbar.dart';

import '../../../widgets/sized_box.dart';
import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(title: ''),
        bottomNavigationBar: CustomNavbar(
          initialActiveIndex: 2,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                      child: Text(
                    "SNAP!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
              verticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Obx(() => controller.image.value != null
                        ? Image.file(
                            controller.image.value!,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            child: const Icon(
                              Icons.camera_alt,
                              size: 100,
                            ),
                          )),
                  ),
                ),
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        controller.getImage();
                      },
                      child: const Text(
                        "Ambil Gambar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        if (controller.image.value != null) {
                          Get.toNamed("/confirm-report",
                              arguments: controller.image.value!);
                        } else {
                          Get.snackbar("Gagal", "Ambil gambar terlebih dahulu",
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                      child: const Text(
                        "Selanjutnya",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
