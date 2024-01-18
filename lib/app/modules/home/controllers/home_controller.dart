import 'package:get/get.dart';
import 'package:snapclean/app/data/firebase/firebase_authentication.dart';
import 'package:snapclean/app/data/firebase/firebase_user_repository.dart';
import 'package:snapclean/app/domain/entities/transaction.dart';
import 'package:snapclean/app/domain/entities/user.dart';

class HomeController extends GetxController {
  var dropdownvalue = "Januari".obs;
  Rx<User?> userData = Rx<User?>(null);
  // final FirebaseTransactionRepositry _transactionRepository =
  //     FirebaseTransactionRepositry();
  var reports = <Transaction>[].obs;

  RxInt redStatusCount = 0.obs;
  RxInt yellowStatusCount = 0.obs;
  RxInt greenStatusCount = 0.obs;

  final FirebaseUserRepository _userRepository = FirebaseUserRepository();
  final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();

  List<String> get months => [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
      ];

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Fetch user data when the controller is initialized
    // fetchReports();
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

  // Future<void> fetchReports() async {
  //   try {
  //     // Fetch data from Firebase and update the 'reports' list
  //     String? uid = _firebaseAuth.getLoggedInUserId();

  //     if (uid != null) {
  //       var result = await _transactionRepository.getUserTransactions(uid: uid);

  //       if (result.isSucces) {
  //         // Assuming result.data is a List<Transaction>
  //         var reportList = result.resultValue as List<Transaction>;

  //         // Clear existing data and assign the new list
  //         reports.clear();
  //         reports.assignAll(reportList);
  //       } else {
  //         // Handle the case where fetching user data failed
  //         print("Failed to fetch user data: ${result.errorMassage}");
  //       }
  //     }
  //   } catch (e) {
  //     print("An error occurred: $e");
  //   }
  // }

  // Future<void> fetchReports() async {
  //   try {
  //     String? uid = _firebaseAuth.getLoggedInUserId();

  //     if (uid != null) {
  //       var result = await _transactionRepository.getUserTransactions(uid: uid);

  //       if (result.isSucces) {
  //         var reportList = result.resultValue as List<Transaction>;
  //         reports.clear();
  //         reports.assignAll(reportList);

  //         // Hitung jumlah status
  //         redStatusCount.value +=
  //             reports.where((report) => report.status == 0).length;
  //         yellowStatusCount.value +=
  //             reports.where((report) => report.status == 1).length;
  //         greenStatusCount.value +=
  //             reports.where((report) => report.status == 2).length;
  //       } else {
  //         print("Failed to fetch user data: ${result.errorMassage}");
  //       }
  //     }
  //   } catch (e) {
  //     print("An error occurred: $e");
  //   }
  // }

  // // Metode untuk mendapatkan jumlah status merah
  // int getRedStatusCount() {
  //   return redStatusCount.value;
  // }

  // // Metode untuk mendapatkan jumlah status kuning
  // int getYellowStatusCount() {
  //   return yellowStatusCount.value;
  // }

  // // Metode untuk mendapatkan jumlah status hijau
  // int getGreenStatusCount() {
  //   return greenStatusCount.value;
  // }
}
