import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:snapclean/app/modules/change_point/controllers/change_point_controller.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

class RedeemMenu extends GetView<ChangePointController> {
  const RedeemMenu({super.key});

  Widget buildButtonRow(List<String> texts, String containerId) {
    return Row(
      children: texts
          .map((text) => Expanded(
                child: Obx(() => GFButton(
                      onPressed: () {
                        controller.selectedPill.value = containerId + text;
                      },
                      text: text,
                      shape: GFButtonShape.pills,
                      size: GFSize.SMALL,
                      color: controller.selectedPill.value == containerId + text
                          ? Colors.green
                          : Colors.white,
                      textColor: Colors.black,
                    )),
              ))
          .toList(),
    );
  }

  Widget buildContainer(
      Widget title, TextEditingController textcontroller, String containerId) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(244, 244, 244, 1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: title,
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(244, 244, 244, 1),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                buildButtonRow(
                    ["5.000", "10.000", "15.000", "20.000"], containerId),
                buildButtonRow(
                    ["25.000", "50.000", "75.000", "100.000"], containerId),
                verticalSpace(8),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Nomor Telepon/User ID',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            title: const Text('Konfirmasi'),
                            content: Text(
                                'Apakah anda ingin menukarkan poin dengan ${controller.selectedPill.value} ke ${textcontroller.text}?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  'Batal',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  'Ya',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Get.back();
                                  Get.snackbar("Penukaran diterima",
                                      'Silahkan tunggu 1-3 hari kerja',
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      backgroundColor: Colors.green);
                                },
                              ),
                            ],
                          ));
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildContainer(
            const Text(
              "Pulsa",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            controller.pulsaController,
            'pulsa'),
        buildContainer(Image.asset('assets/images/logo_ovo.png'),
            controller.ovoController, 'ovo'),
        buildContainer(Image.asset('assets/images/logo_gopay.png'),
            controller.gopayController, 'gopay'),
        buildContainer(Image.asset('assets/images/logo_dana.png'),
            controller.danaController, 'dana'),
        buildContainer(Image.asset('assets/images/logo_linkaja.png'),
            controller.linkajaController, 'linkaja'),
      ],
    );
  }
}
