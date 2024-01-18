import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapclean/app/domain/entities/transaction.dart';

class DetailReportController extends GetxController {
  final Rx<Transaction?> transaction = Rx<Transaction?>(null);

  // Reference ke koleksi di Firestore
  final firestore.CollectionReference _reportsCollection =
      firestore.FirebaseFirestore.instance.collection('transactions');

  // Metode untuk menghapus laporan
  Future<void> deleteReport(String reportId) async {
    try {
      // Hapus laporan dari Firestore berdasarkan ID
      await _reportsCollection.doc(reportId).delete();

      // Setelah laporan dihapus, kita setel nilai transaction menjadi null
      transaction.value = null;

      // Tampilkan snackbar jika berhasil dihapus
      Get.snackbar(
        "Berhasil",
        "Laporan berhasil dihapus",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      // Handle error jika diperlukan
      print("Error deleting report: $error");
      Get.snackbar(
        "Error",
        "Gagal menghapus laporan. Silakan coba lagi.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
