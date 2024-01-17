import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:snapclean/app/widgets/sized_box.dart';
import 'package:snapclean/app/widgets/text_field.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {

  const EditProfileView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(34, 193, 195, 1),
              Color.fromRGBO(95, 253, 45, 0.74)
            ],
          ),
        ),
      ),
    ),
        body: ListView(
          children: [
            Column(
              children: [
                verticalSpace(30),
                const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.add_a_photo,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                ),
                verticalSpace(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SnapTextField(
                        labelText: 'Nama',
                        controller: controller.nameController,
                        hintText: 'Masukkan nama baru',
                      ),
                      verticalSpace(24),
                      SnapTextField(
                          labelText: 'Alamat',
                          controller: controller.addressController,
                          hintText: 'Masukkan alamat anda'),
                      verticalSpace(50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 145, 231, 131)),
                          onPressed: () {
                            Get.snackbar("Disimpan!", 'Profil berhasil diubah', snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green,colorText: Colors.white);
                          },
                          child: const Text(
                            "Konfirmasi",
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
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
