import 'package:get/get.dart';
import 'package:snapclean/app/data/firebase/firebase_authentication.dart';
import 'package:snapclean/app/data/firebase/firebase_user_repository.dart';
import 'package:snapclean/app/domain/entities/user.dart';
import 'package:snapclean/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  Rx<User?> userData = Rx<User?>(null);

  final FirebaseUserRepository _userRepository = FirebaseUserRepository();
  final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Fetch user data when the controller is initialized
  }

  Future<void> fetchUserData() async {
    String? uid = _firebaseAuth.getLoggedInUserId();

    if (uid != null) {
      var result = await _userRepository.getUser(uid: uid);
      if (result.isSucces) {
        userData.value = result.resultValue;
      } else {
        // Handle the case where fetching user data failed
        print("Failed to fetch user data: ${result.errorMassage}");
      }
    }
  }

  Future<void> logoutUser() async {
    try {
      var logoutResult = await _firebaseAuth.logout();

      if (logoutResult.isSucces) {
        Get.offAllNamed(Routes.LOGIN);
        print("Logout successful!");
      } else {
        print("Logout failed: ${logoutResult.errorMassage}");
      }
    } catch (e) {
      print("An error occurred during logout: $e");
    }
  }
}
