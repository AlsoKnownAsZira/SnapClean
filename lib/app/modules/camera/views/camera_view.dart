import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/camera_controller.dart';
import '../../../widgets/sized_box.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({Key? key}) : super(key: key);
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
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
