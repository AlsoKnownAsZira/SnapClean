// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:snapclean/app/domain/entities/user.dart';
// import 'package:snapclean/app/modules/constants.dart';
// import 'package:snapclean/app/modules/home/views/home_view.dart';
// import 'package:snapclean/app/modules/login/views/login_view.dart';

// class RegisterController extends GetxController {

//   static RegisterController instance = Get.find();
//   late Rx<User?> firebaseUser;

//   @override
//   void onReady() {
//     super.onReady();
//     // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
//     // Since we have to use that many times I just made a constant file and declared there

//     firebaseUser = Rx<User?>(auth.currentUser as User?);

//     firebaseUser.bindStream(auth.userChanges() as Stream<User?>);
//     ever(firebaseUser, _setInitialScreen);
//   }

//   _setInitialScreen(User? user) {
//     if (user == null) {
//       // if the user is not found then the user is navigated to the Register Screen
//       Get.offAll(() => const LoginView());
//     } else {
//       // if the user exists and logged in the the user is navigated to the Home Screen
//       Get.offAll(() => HomeView());
//     }
//   }

//   void register(String email, password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } catch (firebaseAuthException) {}
//   }

//   void login(String email, password) async {
//     try {
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//     } catch (firebaseAuthException) {}
//   }

//   void signOut() async {
//     await auth.signOut();
//   }
// }

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
