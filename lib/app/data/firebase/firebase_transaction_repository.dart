import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:snapclean/app/data/firebase/firebase_user_repository.dart';
import 'package:snapclean/app/data/repositories/transaction_repository.dart';
import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/entities/transaction.dart';

class FirebaseTransactionRepositry implements TransactionRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseTransactionRepositry({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection('transactions');

    try {
      var balanceResult =
          await FirebaseUserRepository().getUserPoint(uid: transaction.uid);

      if (balanceResult.isSucces) {
        int previousBalance = balanceResult.resultValue!;

        if (previousBalance - transaction.total >= 0) {
          // Set transaction
          await transactions.doc(transaction.id).set(transaction.toJson());

          // Cek transaksi sudah ditambahkan atau belum
          var result = await transactions.doc(transaction.id).get();

          if (result.exists) {
            await FirebaseUserRepository().updateUserPoint(
                uid: transaction.uid,
                point: previousBalance - transaction.total);

            return Result.success(Transaction.fromJson(result.data()!));
          } else {
            return const Result.failed('Failed to create transaction data');
          }
        } else {
          return const Result.failed('Insufficient balance');
        }
      } else {
        return const Result.failed('Failed to create transaction data');
      }
    } catch (e) {
      return const Result.failed('Failed to create transaction data');
    }
  }

  @override
  Future<Result<List<Transaction>>> getUserTransactions(
      {required String uid}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection('transactions');

    try {
      var result = await transactions.where('uid', isEqualTo: uid).get();

      if (result.docs.isNotEmpty) {
        return Result.success(
            result.docs.map((e) => Transaction.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return const Result.failed('Failed to get user transactions');
    }
  }

  @override
  Future<Result<Transaction>> createReport(
      {String? id,
      required String uid,
      int? transactionTime,
      String? transactionImage,
      int status = 0,
      required String address,
      required String option,
      required String description,
      required int total,
      int point = 0}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection('transactions');

    await transactions.doc(id).set({
      "id": id,
      "uid": uid,
      "transactionTime": transactionTime,
      "transactionImage": transactionImage,
      "status": status,
      "address": address,
      "option": option,
      "description": description,
      "total": total,
      "point": point
    });

    firestore.DocumentSnapshot<Map<String, dynamic>> result =
        await transactions.doc(uid).get();

    if (result.exists) {
      return Result.success(Transaction.fromJson(result.data()!));
    } else {
      return const Result.failed('Failed to create transaction');
    }
  }
}
