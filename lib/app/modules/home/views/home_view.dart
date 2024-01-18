import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';
import 'package:snapclean/app/widgets/gradient_appbar.dart';
import 'package:snapclean/app/widgets/sized_box.dart';
import 'package:snapclean/app/widgets/spline_chart.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: ''),
      bottomNavigationBar: CustomNavbar(
        initialActiveIndex: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              verticalSpace(20),
              Obx(() {
                // Check if user data is available
                if (controller.userData.value != null) {
                  var user = controller.userData.value!;
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          // Use the user's photo URL
                          backgroundImage: (user.photoUrl != null)
                              ? NetworkImage(user.photoUrl.toString())
                              : const NetworkImage(
                                  "https://locker.com.au/wp-content/uploads/2017/01/user-icon-png-person-user-profile-icon-20.png"),
                        ),
                        horizontalSpace(20),
                        SizedBox(
                          width: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              verticalSpace(1),
                              Text(
                                user.address ?? "-",
                                style: const TextStyle(fontSize: 12),
                              ),
                              verticalSpace(5),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: Colors.red,
                                      ),
                                      horizontalSpace(2),
                                      const Text('1'),
                                    ],
                                  ),
                                  horizontalSpace(30),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: Colors.yellow,
                                      ),
                                      horizontalSpace(2),
                                      const Text('3')
                                    ],
                                  ),
                                  horizontalSpace(30),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: Colors.green,
                                      ),
                                      horizontalSpace(2),
                                      const Text('1')
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Column(
                              children: [
                                const Text(
                                  'Point:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  user.point.toString(),
                                  style: TextStyle(
                                    color: Colors.green[900],
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  // If user data is not available, display a loading indicator or placeholder
                  return const CircularProgressIndicator();
                }
              }),
              verticalSpace(20),
              CarouselSlider.builder(
                itemCount: carouselitems.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(carouselitems[itemIndex],
                                  width: double.infinity,
                                  height: 125.0,
                                  fit: BoxFit.contain),
                            )),
                options: CarouselOptions(
                    height: 125,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 2.0,
                    initialPage: 2,
                    autoPlayInterval: const Duration(seconds: 3)),
              ),
              verticalSpace(10),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            controller.dropdownvalue.value,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        value: controller.dropdownvalue.value,
                        items: controller.months
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (dynamic newValue) {
                          controller.dropdownvalue.value = newValue;
                        },
                      )
                    ],
                  )),
              SplineChart()
            ],
          ),
        ),
      ),
    );
  }

  final List<String> carouselitems = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.png',
    'assets/images/carousel3.png',
  ];
}

// // Widget untuk menampilkan informasi jumlah status
// Widget buildStatusInfo(String status, int count) {
//   return Column(
//     children: [
//       Text(
//         status,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       ),
//       verticalSpace(5),
//       Text(
//         count.toString(),
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//           color: Colors.green,
//         ),
//       ),
//     ],
//   );
// }
