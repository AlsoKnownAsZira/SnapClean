import 'package:snapclean/app/data/repositories/authentication.dart';
import 'package:snapclean/app/data/repositories/user_repository.dart';
import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/entities/user.dart';
import 'package:snapclean/app/domain/usecases/register/register_param.dart';
import 'package:snapclean/app/domain/usecases/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParam> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  Register(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParam params) async {
    var uidResult = await _authentication.register(
        email: params.email, password: params.password);

    if (uidResult.isSucces) {
      var userResult = await _userRepository.createUser(
          uid: uidResult.resultValue!, email: params.email, name: params.name);

      if (userResult.isSucces) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMassage!);
      }
    } else {
      return Result.failed(uidResult.errorMassage!);
    }
  }
}
