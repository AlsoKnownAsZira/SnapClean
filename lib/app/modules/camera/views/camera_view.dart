import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';
import 'package:snapclean/app/widgets/gradient_appbar.dart';
import '../controllers/camera_controller.dart';
import '../../../widgets/sized_box.dart';

class CameraView extends GetView<CameraController> {
  CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(title: ''),
        bottomNavigationBar: CustomNavbar(),
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
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Container(
                    child: Obx(() => controller.image.value != null
                        ? Image.file(
                            controller.image.value!,
                            fit: BoxFit.cover,
                          )
                        : Container()),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              ElevatedButton(
                  onPressed: () {
                    controller.getImage();
                  },
                  child: Text("Ambil Gambar")),
                  
                    ElevatedButton(
                  onPressed: () {
                  if(controller.image.value != null){
                    Get.toNamed("/confirm-report",arguments: controller.image.value!);
                  }else{
                    Get.snackbar("Gagal", "Ambil gambar terlebih dahulu");
                  }
                  },
                  child: Text("Selanjutnya"))
            ],
          ),
        ));
  }
}
