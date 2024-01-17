import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:snapclean/app/widgets/sized_box.dart';
import 'package:snapclean/app/modules/change_point/controllers/change_point_controller.dart';
import 'package:get/get.dart';

class RedeemMenu extends GetView<ChangePointController> {
  Widget buildButtonRow(List<String> texts) {
    return Row(
      children: texts
          .map((text) => Expanded(
                child: GFButton(
                  onPressed: () {},
                  text: text,
                  shape: GFButtonShape.pills,
                  size: GFSize.SMALL,
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ))
          .toList(),
    );
  }

  Widget buildContainer(Widget title, TextEditingController controller) {
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
                buildButtonRow(["5.000", "10.000", "15.000", "20.000"]),
                buildButtonRow(["25.000", "50.000", "75.000", "100.000"]),
                verticalSpace(8),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Nomor Telepon/User ID',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
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
            controller.pulsaController),
        buildContainer(Image.asset('assets/images/logo_ovo.png'),
            controller.ovoController),
        buildContainer(Image.asset('assets/images/logo_gopay.png'), controller.gopayController),
        buildContainer(Image.asset('assets/images/logo_dana.png'), controller.danaController),
        buildContainer(Image.asset('assets/images/logo_linkaja.png'), controller.linkajaController),
      ],
    );
  }
}
