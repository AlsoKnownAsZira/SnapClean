import 'package:get/get.dart';
import 'package:snapclean/app/domain/entities/transaction.dart';

class DetailReportController extends GetxController {
  final Rx<Transaction?> transaction = Rx<Transaction?>(null);
}
