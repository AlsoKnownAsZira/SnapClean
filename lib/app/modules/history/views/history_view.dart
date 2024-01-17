import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/modules/history/views/done_history.dart';
import 'package:snapclean/app/modules/history/views/pending_history.dart';
import 'package:snapclean/app/modules/history/views/sent_history.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  final int initialTabIndex;

  HistoryView({Key? key, required this.initialTabIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavbar(initialActiveIndex: 1,),
        body: DefaultTabController(
      length: _tabs.length,
      initialIndex: initialTabIndex,
      child: Scaffold(
        appBar: AppBar(
          leading:const  SizedBox(),
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.6, 0.6],
                colors: [
                  Color.fromRGBO(34, 193, 195, 1),
                  Color.fromRGBO(95, 253, 45, 0.74),
                  Colors.white,
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green,
            tabs: [
              Tab(
                child: Column(
                  children: [Icon(Icons.send), Text('Terkirim')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Icon(Icons.av_timer), Text('Proses')],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Icon(Icons.download_done_outlined),
                    Text('Selesai')
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    ));
  }

  final List<Widget> _tabs = [
    const SentHistory(),
    const PendingHistory(),
    const DoneHistory()
  ];
}
