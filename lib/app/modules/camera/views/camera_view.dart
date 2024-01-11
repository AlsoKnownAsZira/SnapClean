import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/camera_controller.dart';
import '../../../widgets/sized_box.dart';

class CameraView extends GetView<CameraController> {
  CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromRGBO(34, 193, 195, 1),
                  Color.fromRGBO(95, 253, 45, 0.74)
                ],
              ),
            ),
          ),
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
                    Get.toNamed("/confirm-report");
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
