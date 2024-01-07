import 'package:get/get.dart';

import '../controllers/confirm_report_controller.dart';

class ConfirmReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmReportController>(
      () => ConfirmReportController(),
    );
  }
}
