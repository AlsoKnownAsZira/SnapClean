import 'package:get/get.dart';

import '../controllers/reward_controller.dart';
import 'package:snapclean/app/modules/change_point/controllers/change_point_controller.dart';
class RewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardController>(
      () => RewardController(),
    );
     Get.lazyPut<ChangePointController>(
      () => ChangePointController(),
      fenix: true,
    );
  }
}
