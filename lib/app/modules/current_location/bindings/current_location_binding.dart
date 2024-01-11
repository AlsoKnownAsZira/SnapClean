import 'package:get/get.dart';

import '../controllers/current_location_controller.dart';

class CurrentLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurrentLocationController>(
      () => CurrentLocationController(),
    );
  }
}
