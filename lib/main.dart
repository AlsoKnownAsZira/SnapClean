import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/modules/register/controllers/register_controller.dart';
import 'package:snapclean/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  RegisterController registerController = Get.put(RegisterController());
  // Check if the user is already authenticated
  if (await registerController.isUserLoggedIn()) {
    // If the user is logged in, navigate to the home page
    runApp(GetMaterialApp(
      title: "Application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ));
  } else {
    // If the user is not logged in, show the login page
    runApp(GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ));
  }
}
