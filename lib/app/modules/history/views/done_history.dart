import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snapclean/app/modules/detail_report/views/detail_report_view.dart';
import 'package:snapclean/app/modules/history/controllers/history_controller.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

class DoneHistory extends StatelessWidget {
  final HistoryController reportsController = Get.put(HistoryController());

  DoneHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Fetch the reports when the widget is built
        future: reportsController.fetchReports(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Obx(
              () => ListView.builder(
                itemCount: reportsController.reports.length,
                itemBuilder: (context, index) {
                  var report = reportsController.reports[index];
                  if (report.status == 2) {
                    Uint8List bytes = base64.decode(report.transactionImage!);

                    // Create a file and write the bytes to it
                    MemoryImage memoryImage = MemoryImage(bytes);
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: InkWell(
                        onTap: () {
                          // Pass the selected report to the detail view
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailReportView(),
                              settings: RouteSettings(
                                arguments: reportsController.reports[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                blurRadius: 2,
                                spreadRadius: 0.1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: memoryImage,
                                          fit: BoxFit.cover)),
                                ),
                                horizontalSpace(15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      report.address,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('EEEE, d MMMM y').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              report.transactionTime ?? 0)),
                                      style: const TextStyle(fontSize: 15),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
