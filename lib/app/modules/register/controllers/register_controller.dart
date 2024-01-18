import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/data/firebase/firebase_authentication.dart';
import 'package:snapclean/app/data/firebase/firebase_user_repository.dart';
import 'package:snapclean/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reTypePasswordController =
      TextEditingController();

  final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();
  final FirebaseUserRepository _userRepository = FirebaseUserRepository();

  RxBool isLoading = false.obs;

  Future<void> registerUser(
      String email, String password, String name, String address) async {
    try {
      isLoading.value = true;

      // Register the user
      var registrationResult =
          await _firebaseAuth.register(email: email, password: password);

      if (registrationResult.isSucces) {
        // Get the user ID after successful registration
        String userId = registrationResult.resultValue!;

        // Create a user object and add additional information
        var createUserResult = await _userRepository.createUser(
            uid: userId, email: email, name: name, address: address);

        if (createUserResult.isSucces) {
          // User registration and creation were successful

          // Navigate to the home page after successful registration
          Get.offAllNamed(Routes.HOME);
          print("User registered successfully!");
        } else {
          // Handle user creation failure
          print("User creation failed: ${createUserResult.errorMassage}");
        }
      } else {
        // Handle user registration failure
        print("User registration failed: ${registrationResult.errorMassage}");
      }
    } catch (e) {
      // Handle general exception
      print("An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> isUserLoggedIn() async {
    try {
      // Check if there is a current user
      User? currentUser = FirebaseAuth.instance.currentUser;

      // Return true if there is a logged-in user, false otherwise
      return currentUser != null;
    } catch (e) {
      // Handle exceptions if needed
      print("Error checking user login status: $e");
      return false;
    }
  }
}
