import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/data/firebase/firebase_transaction_repository.dart';
import 'package:snapclean/app/modules/camera/controllers/camera_controller.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';

import '../../../widgets/sized_box.dart';
import '../controllers/confirm_report_controller.dart';

class ConfirmReportView extends GetView<ConfirmReportController> {
  ConfirmReportView({Key? key, required this.currentLocation})
      : super(key: key);
  final ConfirmReportController _controller =
      Get.put(ConfirmReportController());
  final FirebaseTransactionRepositry _transactionRepositry =
      FirebaseTransactionRepositry();
  String? currentLocation;

  @override
  Widget build(BuildContext context) {
    final CameraController controllerCamera = Get.find<CameraController>();
    final File? image = Get.arguments;

    return Scaffold(
        bottomNavigationBar: CustomNavbar(),
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
              verticalSpace(15),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                      child: Text(
                    "CLEAN!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                      image: image != null
                          ? DecorationImage(
                              image: FileImage(image), fit: BoxFit.cover)
                          : DecorationImage(
                              image: FileImage(controllerCamera.image.value!),
                              fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.grey,
                          ),
                          child: IconButton(
                              onPressed: () {
                                Get.offNamed('/current-location',
                                    arguments: controller.image.value);
                              },
                              icon: const Icon(
                                Icons.pin_drop,
                                color: Colors.red,
                              ))),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 2)),
                          height: 52,
                          child: (currentLocation == '')
                              ? TextField(
                                  controller: controller.locationController)
                              : Center(child: Text(currentLocation!)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              verticalSpace(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Text(
                    "Opsi Membersihkan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
              verticalSpace(20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomRadioButton(
                    elevation: 0,
                    selectedBorderColor: Colors.transparent,
                    unSelectedBorderColor: Colors.transparent,
                    absoluteZeroSpacing: true,
                    buttonLables: const ['Sendiri', 'Petugas'],
                    buttonValues: const ['sendiri', 'petugas'],
                    radioButtonValue: (_) {},
                    unSelectedColor: Colors.grey,
                    selectedColor: Colors.green,
                    defaultSelected: 'sendiri',
                  )),
              verticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2)),
                  height: 140,
                  width: double.infinity,
                  child: TextField(
                    minLines: 10,
                    maxLines: null,
                    controller: controller.descriptionController,
                  ),
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 145, 231, 131)),
                      onPressed: () async {
                        // Panggil fungsi CreateTransaction
                        // convert image into file object
                        File imageFile = controllerCamera.image.value!;
                        // Read bytes from the file object
                        Uint8List bytes = await imageFile.readAsBytes();

                        // base64 encode the bytes
                        String base64String = base64.encode(bytes);

                        var user = controller.userData.value!.uid;
                        int transactionTime =
                            DateTime.now().millisecondsSinceEpoch;

                        _controller.createReport(
                            'flx-$transactionTime-$user',
                            base64String,
                            user,
                            transactionTime,
                            (currentLocation == '')
                                ? controller.locationController.text
                                : currentLocation!,
                            "petugas",
                            controller.descriptionController.text,
                            0);
                        Get.offAllNamed('/history');
                      },
                      child: Obx(() => _controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Kirim Laporan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                    )),
              ),
              verticalSpace(50),
            ],
          ),
        ));
  }
}
