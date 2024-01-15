import 'dart:io';

import 'package:snapclean/app/domain/entities/user.dart';

class UploadProfilePictureParam {
  final File imageFile;
  final User user;

  UploadProfilePictureParam({required this.imageFile, required this.user});
}
