import 'package:get/get.dart';
import 'package:snapclean/app/data/firebase/firebase_authentication.dart';
import 'package:snapclean/app/data/firebase/firebase_transaction_repository.dart';
import 'package:snapclean/app/data/firebase/firebase_user_repository.dart';
import 'package:snapclean/app/domain/entities/transaction.dart';
import 'package:snapclean/app/domain/entities/user.dart';

class HistoryController extends GetxController {
  final FirebaseUserRepository _userRepository = FirebaseUserRepository();
  final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();
  final FirebaseTransactionRepositry _transactionRepository =
      FirebaseTransactionRepositry();
  var reports = <Transaction>[].obs;
  Rx<User?> userData = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Fetch user data when the controller is initialized
    fetchReports();
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

  Future<void> fetchReports() async {
    try {
      // Fetch data from Firebase and update the 'reports' list
      String? uid = _firebaseAuth.getLoggedInUserId();

      if (uid != null) {
        var result = await _transactionRepository.getUserTransactions(uid: uid);

        if (result.isSucces) {
          // Assuming result.data is a List<Transaction>
          var reportList = result.resultValue as List<Transaction>;

          // Clear existing data and assign the new list
          reports.clear();
          reports.assignAll(reportList);
        } else {
          // Handle the case where fetching user data failed
          print("Failed to fetch user data: ${result.errorMassage}");
        }
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }
}
