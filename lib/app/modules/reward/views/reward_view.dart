import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snapclean/app/modules/change_point/views/change_point_view.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';
import '../controllers/reward_controller.dart';
import '../../../widgets/sized_box.dart';
import '../../../widgets/gradient_appbar.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class RewardView extends GetView<RewardController> {
  const RewardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomNavbar(
          initialActiveIndex: 3,
        ),
        appBar: GradientAppBar(title: ""),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(125),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("POINTS",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text(
                          controller.points.toString(),
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 215, 232, 25)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Tukarkan poin ada !",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () => Get.to(ChangePointView()),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Ke Reward",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // ),
              verticalSpace(40),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomRadioButton(
                    elevation: 0,
                    selectedBorderColor: Colors.transparent,
                    unSelectedBorderColor: Colors.transparent,
                    absoluteZeroSpacing: true,
                    buttonLables: const ['Keluar', 'Masuk'],
                    buttonValues: const ['keluar', 'masuk'],
                    radioButtonValue: (value) {
                      controller.setSelectedValue(value);
                    },
                    unSelectedColor: Colors.grey,
                    selectedColor: Colors.green,
                    defaultSelected: 'keluar',
                  )),
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: ListView(
                    children: [
                      Obx(() {
                        return ListTile(
                          title: Text(controller.selectedValue.value == 'keluar'
                              ? "Pulsa Telkomsel Rp50.000,00"
                              : "Pemasukan Pelaporan"),
                          subtitle: Text(
                              DateFormat('dd-MM-yyyy').format(DateTime.now())),
                          trailing: Text(
                            controller.selectedValue.value == 'keluar'
                                ? "- 50"
                                : "+ 50",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: controller.selectedValue.value == 'keluar'
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        );
                      }),
                      // ...
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
