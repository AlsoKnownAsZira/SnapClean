import 'package:snapclean/app/data/repositories/transaction_repository.dart';
import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/entities/transaction.dart';
import 'package:snapclean/app/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:snapclean/app/domain/usecases/usecase.dart';

class CreateTransaction
    implements UseCase<Result<Transaction>, CreateTransactionParam> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  // @override
  // Future<Result<void>> call(CreateTransactionParam params) async {
  //   int transactionTime = DateTime.now().millisecondsSinceEpoch;

  //   var result = await _transactionRepository.createTransaction(
  //       transaction: params.transaction.copyWith(
  //           transactionTime: transactionTime,
  //           id: (params.transaction.id == null)
  //               ? 'flx-$transactionTime-${params.transaction.uid}'
  //               : params.transaction.id));

  //   return switch (result) {
  //     Success(value: _) => const Result.success(null),
  //     Failed(message: final message) => Result.failed(message)
  //   };
  // }
  @override
  Future<Result<Transaction>> call(CreateTransactionParam params) async {
    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    var result = await _transactionRepository.createReport(
        uid: params.transaction.uid,
        transactionImage: params.transaction.transactionImage,
        status: params.transaction.status,
        address: params.transaction.address,
        option: params.transaction.option,
        total: params.transaction.total,
        description: params.transaction.description,
        transactionTime: transactionTime,
        point: params.transaction.point,
        id: (params.transaction.id == null)
            ? 'flx-$transactionTime-${params.transaction.uid}'
            : params.transaction.id);

    if (result.isSucces) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMassage!);
    }
    // return switch (result) {
    //   Success(value: _) => const Result.success(),
    //   Failed(message: final message) => Result.failed(message)
    // };
  }
}
