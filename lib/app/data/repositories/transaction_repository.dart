import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/entities/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction});
  Future<Result<List<Transaction>>> getUserTransactions({required String uid});
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
      int point = 0});
}
