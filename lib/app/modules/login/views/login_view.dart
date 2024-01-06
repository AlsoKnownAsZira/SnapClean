import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
          'https://w7.pngwing.com/pngs/469/94/png-transparent-camera-logo-graphy-camera-text-camera-lens-rectangle-thumbnail.png',
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
                hintText: 'Type your email'),
            verticalSpace(24),
            SnapTextField(
                labelText: 'Password',
                controller: controller.passwordController,
                obscureText: true,
                hintText: 'Type your password'),
            verticalSpace(8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot password?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            verticalSpace(24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                // ref.read(userDataProvider.notifier).login(
                //     email: emailController.text,
                //     password: passwordController.text);
              },
              child: const Text(
                "Login",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ))
              ],
            )
          ],
        ),
      ),
    ]));
  }
}
