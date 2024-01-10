import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/confirm_report_controller.dart';
import '../../../widgets/sized_box.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class ConfirmReportView extends GetView<ConfirmReportController> {
  const ConfirmReportView({Key? key}) : super(key: key);
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
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.grey,
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.pin_drop,
                                color: Colors.red,
                              ))),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 2)),
                          height: 45,
                          child: TextField(
                              minLines: 5,
                              maxLines: null,
                              controller: controller.locationController),
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
                    buttonLables: ['Sendiri', 'Petugas'],
                    buttonValues: ['sendiri', 'petugas'],
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
                  height: 150,
                
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
                        onPressed: () {},
                        child: const Text(
                          'Kirim Laporan',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ))),
              ),
            ],
          ),
        ));
  }
}
