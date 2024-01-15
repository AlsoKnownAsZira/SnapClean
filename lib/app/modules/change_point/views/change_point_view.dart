import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

import '../controllers/change_point_controller.dart';

class ChangePointView extends GetView<ChangePointController> {
  const ChangePointView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
      body: ListView(
        children: [
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
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
                          child: const Center(
                              child: Text(
                            'PULSA',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
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
                            Row(
                              children: [
                                GFButton(
                                  onPressed: () {},
                                  text: "5.000",
                                  shape: GFButtonShape.pills,
                                  size: GFSize.SMALL,
                                  color: Colors.white, // Set button color
                                  textColor: Colors.black, // Set text color
                                ),
                                horizontalSpace(10),
                                GFButton(
                                  onPressed: () {},
                                  text: "10.000",
                                  shape: GFButtonShape.pills,
                                  size: GFSize.SMALL,
                                  color: Colors.white, // Set button color
                                  textColor: Colors.black, // Set text color
                                ),
                                horizontalSpace(10),
                                GFButton(
                                  onPressed: () {},
                                  text: "15.000",
                                  shape: GFButtonShape.pills,
                                  size: GFSize.SMALL,
                                  color: Colors.white, // Set button color
                                  textColor: Colors.black, // Set text color
                                ),
                                horizontalSpace(10),
                                GFButton(
                                  onPressed: () {},
                                  text: "20.000",
                                  shape: GFButtonShape.pills,
                                  size: GFSize.SMALL,
                                  color: Colors.white, // Set button color
                                  textColor: Colors.black, // Set text color
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GFButton(
                                  onPressed: () {},
                                  text: "25.000",
                                  shape: GFButtonShape.pills,
                                  size: GFSize.SMALL,
                                  color: Colors.white, // Set button color
                                  textColor: Colors.black, // Set text color
                                ),
                                horizontalSpace(10),
                                GFButton(
                                  onPressed: () {},
                                  text: "50.000",
                                  shape: GFButtonShape.pills,
                                  size: GFSize.SMALL,
                                  color: Colors.white, // Set button color
                                  textColor: Colors.black, // Set text color
                                ),
                                horizontalSpace(10),
                                GFButton(
                                  onPressed: () {},
                                  text: "75.000",
                                  shape: GFButtonShape.pills,
                                  size: GFSize.SMALL,
                                  color: Colors.white, // Set button color
                                  textColor: Colors.black, // Set text color
                                ),
                                horizontalSpace(10),
                                GFButton(
                                  onPressed: () {},
                                  text: "100.000",
                                  shape: GFButtonShape.pills,
                                  size: GFSize.SMALL,
                                  color: Colors.white, // Set button color
                                  textColor: Colors.black, // Set text color
                                ),
                              ],
                            ),
                            verticalSpace(8),
                            SizedBox(
                              height: 40,
                              child: TextField(
                                controller: controller.telpController,
                                decoration: InputDecoration(
                                    labelText: 'No Telp',
                                    hintText: 'Masukkan Nomor Handphone',
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade700)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
