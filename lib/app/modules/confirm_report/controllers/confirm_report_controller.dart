import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snapclean/app/data/firebase/firebase_authentication.dart';
import 'package:snapclean/app/data/firebase/firebase_transaction_repository.dart';
import 'package:snapclean/app/data/firebase/firebase_user_repository.dart';
import 'package:snapclean/app/domain/entities/user.dart';
import 'package:snapclean/app/modules/current_location/views/current_location_view.dart';
import 'package:snapclean/app/routes/app_pages.dart';

class ConfirmReportController extends GetxController {
  Rx<User?> userData = Rx<User?>(null);

  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final FirebaseUserRepository _userRepository = FirebaseUserRepository();
  final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();
  final FirebaseTransactionRepositry _transactionRepositry =
      FirebaseTransactionRepositry();

  var image = Rx<File?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Fetch user data when the controller is initialized
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageTaken =
        await picker.pickImage(source: ImageSource.camera);

    if (imageTaken != null) {
      image.value = File(imageTaken.path);
    } else {
      print('Tidak ada Gambar');
    }
  }

  Future<void> _selectLocation() async {
    LatLng selectedLocation = await Get.to(() => CurrentLocationScreen(
          onLocationSelected: (LatLng location) {
            // Update the controller's locationController with the selected location
            locationController.text =
                "Lat: ${location.latitude}, Long: ${location.longitude}";
          },
        ));
    // You can use the selectedLocation if needed.
  }

  Future<void> fetchUserData() async {
    String? uid = _firebaseAuth.getLoggedInUserId();

    if (uid != null) {
      var result = await _userRepository.getUser(uid: uid);
      if (result.isSucces) {
        userData.value = result.resultValue;
      } else {
        // Handle the case where fetching user data failed
        print("Failed to fetch user data: ${result.errorMassage}");
      }
    }
  }

  Future<void> createReport(
      String id,
      String image,
      String user,
      int trasactionTime,
      String address,
      String option,
      String description,
      int total) async {
    try {
      isLoading.value = true;

      var createTransactionResult = await _transactionRepositry.createReport(
          id: id,
          transactionImage: image,
          uid: user,
          transactionTime: trasactionTime,
          address: address,
          option: option,
          description: description,
          total: total);

      // Cek hasil createTransactionResult
      if (createTransactionResult.isSucces) {
        // User registration and creation were successful

        // Navigate to the home page after successful registration
        Get.offAllNamed(Routes.HOME);
        print("User registered successfully!");
      } else {
        // Handle user creation failure

        print("User creation failed: ${createTransactionResult.errorMassage}");
      }
    } catch (e) {
      // Handle general exception
      print("An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
