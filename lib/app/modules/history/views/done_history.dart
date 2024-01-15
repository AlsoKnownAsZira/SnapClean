import 'package:flutter/material.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

class DoneHistory extends StatefulWidget {
  const DoneHistory({super.key});

  @override
  State<DoneHistory> createState() => _DoneHistoryState();
}

class _DoneHistoryState extends State<DoneHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // Warna bayangan
                          offset: Offset(0, 2), // Posisi bayangan (x, y)
                          blurRadius: 2, // Radius blur bayangan
                          spreadRadius: 0.1, // Sebaran bayangan
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Image.network(
                            'https://tse4.mm.bing.net/th?id=OIP.dcO6APRL4BTHohClTGOa8wAAAA&pid=Api&P=0&h=180',
                            width: 100,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          horizontalSpace(15),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jln. Bunga Andong no 3F',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                'Senin, 01/01/2024',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
