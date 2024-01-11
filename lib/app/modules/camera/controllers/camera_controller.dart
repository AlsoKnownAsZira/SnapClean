import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraController extends GetxController {
  var image = Rx<File?>(null);

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageTaken =
        await picker.pickImage(source: ImageSource.camera);

    if (imageTaken != null) {
      image.value = File(imageTaken.path);
    } else {
      print('Tidak ada Gambar');
    }
  }
}
