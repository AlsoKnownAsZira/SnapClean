import 'package:get/get.dart';

import '../controllers/change_point_controller.dart';
import 'package:snapclean/app/modules/reward/bindings/reward_binding.dart';
class ChangePointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePointController>(
      () => ChangePointController(),
    );
   
  }
}
