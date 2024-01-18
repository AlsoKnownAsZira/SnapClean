import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snapclean/app/modules/confirm_report/views/confirm_report_view.dart';
import 'package:snapclean/app/widgets/gradient_appbar.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

class CurrentLocationScreen extends StatefulWidget {
  final Function(LatLng) onLocationSelected;

  const CurrentLocationScreen({Key? key, required this.onLocationSelected})
      : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};
  Position? _position;

  @override
  Widget build(BuildContext context) {
    final File? image = Get.arguments;
    return Scaffold(
      appBar: GradientAppBar(title: 'Posisi Terkini Pengguna'),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextButton(
                      onPressed: () async {
                        Position position = await _determinePosition();

                        googleMapController.animateCamera(
                            CameraUpdate.newCameraPosition(CameraPosition(
                                target: LatLng(
                                    position.latitude, position.longitude),
                                zoom: 14)));

                        markers.clear();

                        markers.add(Marker(
                            markerId: const MarkerId('currentLocation'),
                            position:
                                LatLng(position.latitude, position.longitude)));

                        // Call the callback with the selected location
                        widget.onLocationSelected(
                            LatLng(position.latitude, position.longitude));

                        setState(() {});

                        _position = position;
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_history,
                            color: Colors.black,
                            size: 35,
                          ),
                          horizontalSpace(2),
                          const Text(
                            'Current Location',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_position != null) {
            Get.off(
              () => ConfirmReportView(
                  currentLocation:
                      "Lat: ${_position!.latitude}, Long: ${_position!.longitude}"),
            );
          } else {
            Get.snackbar("Gagal", "Tentukan lokasi terlebih dahulu",
                backgroundColor: Colors.red,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM);
          }
        },
        backgroundColor: Colors.green,
        label: const Text(
          "Simpan Lokasi",
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add_box_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
