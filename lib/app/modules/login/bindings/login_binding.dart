import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../../../modules/home/controllers/home_controller.dart';
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut(() => HomeController());
  }
}
