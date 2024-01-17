import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    String? id,
    required String uid,
    int? transactionTime,
    String? transactionImage,
    @Default(0) int status,
    @Default(0) point,
    required String address,
    required String option,
    required String description,
    required int total,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
