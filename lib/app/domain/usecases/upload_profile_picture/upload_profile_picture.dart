import 'package:snapclean/app/data/repositories/user_repository.dart';
import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/entities/user.dart';
import 'package:snapclean/app/domain/usecases/upload_profile_picture/upload_profile_picture_param.dart';
import 'package:snapclean/app/domain/usecases/usecase.dart';

class UploadProfilePicture
    implements UseCase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Result<User>> call(UploadProfilePictureParam params) => _userRepository
      .uploadProfilePicture(user: params.user, imageFile: params.imageFile);
}
