import 'package:get/get.dart';

class RewardController extends GetxController {
  //TODO: Implement RewardController

 var points = 420.obs;
  var rewards = 50.obs;
  var rewardDate = DateTime.now().obs;
var selectedValue = 'keluar'.obs;
 void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
