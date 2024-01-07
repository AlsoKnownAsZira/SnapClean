import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import '../../../widgets/text_field.dart';
import '../../../widgets/sized_box.dart';
import 'package:flutter/material.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            verticalSpace(50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Buat Akun Anda",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
              ),
            ),
            verticalSpace(24),
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.add_a_photo,
                size: 50.0,
                color: Colors.grey,
              ),
            ),
            verticalSpace(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SnapTextField(
                    labelText: 'Email',
                    controller: controller.emailController,
                    hintText: 'Contoh: email@gmail.com',
                  ),
                  verticalSpace(24),
                  SnapTextField(
                    labelText: 'Nama',
                    controller: controller.nameController,
                    hintText: 'Masukkan Nama Anda',
                  ),
                  verticalSpace(24),
                  SnapTextField(
                      labelText: 'Password',
                      controller: controller.passwordController,
                      obscureText: true,
                      hintText: 'Masukkan password anda'),
                  verticalSpace(24),
                  SnapTextField(
                    labelText: 'Konfirmasi Password',
                    controller: controller.reTypePasswordController,
                    obscureText: true,
                    hintText: 'Masukkan password anda kembali',
                  ),
                  verticalSpace(24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 145, 231, 131)),
                      onPressed: () {
                        if (controller.passwordController.text ==
                            controller.reTypePasswordController.text) {
                          Get.offNamed('/login');
                        } else {
                          // context.showSnackBar(
                          //     'Your confirmation password is not the same');
                        }
                      },
                      child: const Text(
                        "Daftar",
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
                  //             style: ElevatedButton.styleFrom(
                  //                 backgroundColor: Colors.green),
                  //             onPressed: () {
                  //               if (controller.passwordController.text ==
                  //                   controller.reTypePasswordController
                  //                       .text) {
                  //               } else {
                  //                 // context.showSnackBar(
                  //                 //     'Your confirmation password is not the same');
                  //               }
                  //             },
                  //             child: const Text(
                  //               "Register",
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
                      const Text("Sudah punya akun?"),
                      TextButton(
                          onPressed: () {
                            Get.offNamed('/login');
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 72, 192, 134)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
