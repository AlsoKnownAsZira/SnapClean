import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

import '../controllers/detail_report_controller.dart';

class DetailReportView extends GetView<DetailReportController> {
  const DetailReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomNavbar(
          initialActiveIndex: 1,
        ),
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
                    "DETAIL LAPORAN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
              verticalSpace(10),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      5), // Sesuaikan ukuran border radius
                  border: Border.all(
                    color: Colors.grey, // Sesuaikan warna border
                    width: 3, // Sesuaikan lebar border
                  ),
                ),
                child: Image.network(
                  'https://tse4.mm.bing.net/th?id=OIP.dcO6APRL4BTHohClTGOa8wAAAA&pid=Api&P=0&h=180',
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpace(15),
              Container(
                child: Column(
                  children: [
                    const Text(
                      'ALAMAT',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(2),
                    Container(
                      width: 300,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            5), // Sesuaikan ukuran border radius
                        border: Border.all(
                          color: Colors.grey, // Sesuaikan warna border
                          width: 2, // Sesuaikan lebar border
                        ),
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Jln. Lurah Surodarmo 2',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
              verticalSpace(15),
              Container(
                child: Column(
                  children: [
                    const Text(
                      'TANGGAL LAPOR',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(2),
                    Container(
                      width: 300,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            5), // Sesuaikan ukuran border radius
                        border: Border.all(
                          color: Colors.grey, // Sesuaikan warna border
                          width: 2, // Sesuaikan lebar border
                        ),
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Senin, 01/01/2024',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
              verticalSpace(15),
              Container(
                child: Column(
                  children: [
                    const Text(
                      'KETERANGAN',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(2),
                    Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            5), // Sesuaikan ukuran border radius
                        border: Border.all(
                          color: Colors.grey, // Sesuaikan warna border
                          width: 2, // Sesuaikan lebar border
                        ),
                      ),
                      child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Karena banyaknya sampah tolong kirimkan sekalian truk sampah agar efisien saat membersihkannya.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
              verticalSpace(20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red), // Warna latar belakang

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Sudut-sudut border
                          // Lainnya sesuai kebutuhan
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                "Hapus Laporan",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                "Apa anda yakin ingin menghapus laporan?",
                                style: TextStyle(fontSize: 15),
                              ),
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.cancel_outlined,
                                      size: 35,
                                      color: Colors.red,
                                    )),
                                horizontalSpace(5),
                                IconButton(
                                    onPressed: () {
                                      Get.offNamed('/history');

                                      Get.snackbar("Selesai!",
                                          "Laporan anda berhasil dihapus",
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM);
                                    },
                                    icon: const Icon(
                                      Icons.done,
                                      size: 35,
                                      color: Colors.green,
                                    )),
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'HAPUS LAPORAN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              )
            ],
          ),
        ));
  }
}
