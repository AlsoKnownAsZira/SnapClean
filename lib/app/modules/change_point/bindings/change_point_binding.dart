import 'package:get/get.dart';

import '../controllers/change_point_controller.dart';

class ChangePointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePointController>(
      () => ChangePointController(),
    );
   
  }
}
