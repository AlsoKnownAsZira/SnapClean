import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snapclean/app/domain/entities/transaction.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

import '../controllers/detail_report_controller.dart';

class DetailReportView extends GetView<DetailReportController> {
  DetailReportView({Key? key}) : super(key: key);
  final DetailReportController _controller = Get.put(DetailReportController());
  @override
  Widget build(BuildContext context) {
    // Transaction? report = controller.transaction.value;
    Transaction? report = Get.arguments as Transaction;
    Uint8List bytes = base64.decode(report.transactionImage!);

    // Create a file and write the bytes to it
    // File file = File('image');
    // file.writeAsBytesSync(bytes);
    MemoryImage memoryImage = MemoryImage(bytes);
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
                  image: DecorationImage(image: memoryImage, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(
                      5), // Sesuaikan ukuran border radius
                  border: Border.all(
                    color: Colors.grey, // Sesuaikan warna border
                    width: 3, // Sesuaikan lebar border
                  ),
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
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            report.address,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            DateFormat('EEEE, d MMMM y').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    report.transactionTime ?? 0)),
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            report.description,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
              verticalSpace(20),
              SizedBox(
                width: 200,
                child: (report.status == 0)
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red), // Warna latar belakang

                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Sudut-sudut border
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                          _controller.deleteReport(report.id!);
                                          Get.offAllNamed('/history');
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
                        ))
                    : const SizedBox.shrink(),
              )
            ],
          ),
        ));
  }
}
