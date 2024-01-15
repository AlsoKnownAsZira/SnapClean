import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/data/firebase/firebase_authentication.dart';
import 'package:snapclean/app/data/firebase/firebase_user_repository.dart';
import 'package:snapclean/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();
  final FirebaseUserRepository _userRepository = FirebaseUserRepository();

  RxBool isLoading = false.obs;

  Future<void> loginUser(String email, String password) async {
    try {
      var loginResult = await _firebaseAuth.login(
        email: email,
        password: password,
      );

      if (loginResult.isSucces) {
        Get.offAllNamed(Routes.HOME);
        print("Login successful! User ID: ${loginResult.resultValue}");
      } else {
        print("Login failed: ${loginResult.errorMassage}");
      }
    } catch (e) {
      print("An error occurred during login: $e");
    }
  }
}
