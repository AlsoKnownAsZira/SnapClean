import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/data/firebase/firebase_authentication.dart';
import 'package:snapclean/app/data/firebase/firebase_user_repository.dart';
import 'package:snapclean/app/domain/entities/user.dart';

class ChangePointController extends GetxController {
  TextEditingController pulsaController = TextEditingController();
  TextEditingController danaController = TextEditingController();
  TextEditingController gopayController = TextEditingController();
  TextEditingController ovoController = TextEditingController();
  TextEditingController linkajaController = TextEditingController();
  var selectedPill = ''.obs;

  Rx<User?> userData = Rx<User?>(null);

  final FirebaseUserRepository _userRepository = FirebaseUserRepository();
  final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Fetch user data when the controller is initialized
    // fetchReports();
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
}
