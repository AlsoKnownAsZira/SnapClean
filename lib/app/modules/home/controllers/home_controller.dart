import 'package:get/get.dart';

class HomeController extends GetxController {
  var dropdownvalue = "Januari".obs;
   List<String> get months => [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
      ];
}
