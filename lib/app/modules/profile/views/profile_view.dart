import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:snapclean/app/modules/profile/methods/profile_item.dart';
import 'package:snapclean/app/widgets/custom_navbar.dart';
import 'package:snapclean/app/widgets/gradient_appbar.dart';
import 'package:snapclean/app/widgets/sized_box.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomNavbar(),
        appBar: GradientAppBar(title: ''),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                verticalSpace(20),
                Obx(() {
                  // Check if user data is available
                  if (controller.userData.value != null) {
                    var user = controller.userData.value!;
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30.0,
                            // Use the user's photo URL
                            backgroundImage: (user.photoUrl != null)
                                ? NetworkImage(user.photoUrl.toString())
                                : const NetworkImage(
                                    "https://locker.com.au/wp-content/uploads/2017/01/user-icon-png-person-user-profile-icon-20.png"),
                          ),
                          horizontalSpace(20),
                          SizedBox(
                            width: 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                verticalSpace(1),
                                Text(
                                  user.address ?? "-",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                verticalSpace(5),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.red,
                                        ),
                                        horizontalSpace(2),
                                        const Text('1'),
                                      ],
                                    ),
                                    horizontalSpace(30),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.yellow,
                                        ),
                                        horizontalSpace(2),
                                        const Text('3')
                                      ],
                                    ),
                                    horizontalSpace(30),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.green,
                                        ),
                                        horizontalSpace(2),
                                        const Text('1')
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              child: Column(
                                children: [
                                  const Text(
                                    'Point:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    user.point.toString(),
                                    style: TextStyle(
                                      color: Colors.green[900],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // If user data is not available, display a loading indicator or placeholder
                    return const CircularProgressIndicator();
                  }
                }),
                verticalSpace(20),
                const Divider(),
                verticalSpace(20),
                profileItem('Edit Profil', onTap: () => Get.to(EditProfileView())),
                verticalSpace(20),
                profileItem('Pointku'),
                verticalSpace(20),
                profileItem('Ganti Password'),
                verticalSpace(50),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50 - 50,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                "Logout",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                "Apa anda yakin ingin logout akun?",
                                style: TextStyle(fontSize: 15),
                              ),
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.cancel_outlined,
                                      size: 35,
                                      color: Colors.red,
                                    )),
                                horizontalSpace(5),
                                IconButton(
                                    onPressed: () {
                                      _controller.logoutUser();
                                    },
                                    icon: const Icon(
                                      Icons.done,
                                      size: 35,
                                      color: Colors.green,
                                    )),
                              ],
                            );
                          });
                    },
                    child: const Text(
                      "LOGOUT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
