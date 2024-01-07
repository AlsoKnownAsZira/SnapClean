import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                verticalSpace(20),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(10), // Ubah sesuai kebutuhan
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(
                              0, 3), // Ubah offset sesuai kebutuhan
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://3.bp.blogspot.com/-jFke770FuUA/VnGN0MqDgzI/AAAAAAAAArI/x8NhcVlH9Ok/s1600/Foto%2BPria%2BGanteng%2BIndonesia%2B%252821%2529.jpg"),
                        ),
                        horizontalSpace(20),
                        SizedBox(
                          width: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Rusdi Komaladi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              verticalSpace(1),
                              const Text(
                                "Jln. Bojongsoang Blok D3",
                                style: TextStyle(fontSize: 12),
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
                                      const Text('1')
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
                                  ),
                                ],
                              )
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
                                  '427',
                                  style: TextStyle(
                                      color: Colors.green[900], fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                verticalSpace(12),
                CarouselSlider.builder(
                  itemCount: carouselitems.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              carouselitems[itemIndex],
                              width: double.infinity,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          )),
                  options: CarouselOptions(
                    height: 120,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 2.0,
                    initialPage: 2,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  final List<String> carouselitems = [
    'https://2.bp.blogspot.com/-wzyqoRtNwA4/VjLDXp3k4GI/AAAAAAAAATo/y_BuHsJyDvE/w1200-h630-p-k-no-nu/keber%2B1.png',
    'https://i.pinimg.com/originals/e3/ca/40/e3ca40b9890ea9088f82895772c3a246.jpg'
  ];
}
