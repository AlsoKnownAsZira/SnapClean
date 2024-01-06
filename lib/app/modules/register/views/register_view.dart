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
                  "Create Your Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.green),
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
                    hintText: 'Example: name@gmail.com',
                  ),
                  verticalSpace(24),
                  SnapTextField(
                    labelText: 'Name',
                    controller: controller.nameController,
                    hintText: 'Type your name',
                  ),
                  verticalSpace(24),
                  SnapTextField(
                      labelText: 'Password',
                      controller: controller.passwordController,
                      obscureText: true,
                      hintText: 'Type your password'),
                  verticalSpace(24),
                  SnapTextField(
                    labelText: 'Confirmation Password',
                    controller: controller.reTypePasswordController,
                    obscureText: true,
                    hintText: 'Retype your password',
                  ),
                  verticalSpace(24),
                  SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                if (controller.passwordController.text ==
                                    controller.reTypePasswordController.text) {
                                } else {
                                  // context.showSnackBar(
                                  //     'Your confirmation password is not the same');
                                }
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
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
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
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