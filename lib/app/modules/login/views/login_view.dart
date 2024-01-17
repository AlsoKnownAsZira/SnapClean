import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/sized_box.dart';
import '../../../widgets/text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final LoginController _controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      verticalSpace(100),
      Center(
        child: Image.asset('assets/images/logo_snapclean.png',
            width: 200)
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
                  _controller.loginUser(
                    controller.emailController.text,
                    controller.passwordController.text,
                  );
                },
                child: Obx(
                  () => _controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Masuk",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                ),
              ),
            ),
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
