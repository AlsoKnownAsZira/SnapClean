import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:snapclean/app/modules/home/views/home_view.dart';

import '../controllers/login_controller.dart';
import '../../../widgets/text_field.dart';
import '../../../widgets/sized_box.dart';

class LoginView extends GetView<LoginController> {
  
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      verticalSpace(100),
      Center(
        child: Image.network(
          'https://i.ibb.co/R0YfD6L/Snap-Clean.jpg',
          width: 150,
        ),
      ),
      verticalSpace(100),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SnapTextField(
                labelText: 'Email',
                controller: controller.emailController,
                hintText: 'Masukkan Email'),
            verticalSpace(24),
            SnapTextField(
                labelText: 'Password',
                controller: controller.passwordController,
                obscureText: true,
                hintText: 'Masukkan password'),
            verticalSpace(8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Lupa Password?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 72, 192, 134)),
              ),
            ),
            verticalSpace(24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 145, 231, 131)),
                onPressed: () {
                  Get.off(HomeView());
                  // ref.read(userDataProvider.notifier).login(
                  //     email: emailController.text,
                  //     password: passwordController.text);
                },
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            // switch (ref.watch(userDataProvider)) {
            //   AsyncData(:final value) => value == null
            //       ? SizedBox(
            //           width: double.infinity,
            //           child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            //             onPressed: () {
            //               // ref.read(userDataProvider.notifier).login(
            //               //     email: emailController.text,
            //               //     password: passwordController.text);
            //             },
            //             child: const Text(
            //               "Login",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.white),
            //             ),
            //           ),
            //         )
            //       : const Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //   _ => const Center(
            //       child: CircularProgressIndicator(),
            //     )
            // },
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun?"),
                TextButton(
                    onPressed: () {
                        Get.offNamed('/register');
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 72, 192, 134)),
                    ))
              ],
            )
          ],
        ),
      ),
    ]));
  }
}
