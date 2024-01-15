import 'package:snapclean/app/data/repositories/authentication.dart';
import 'package:snapclean/app/data/repositories/user_repository.dart';
import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/entities/user.dart';
import 'package:snapclean/app/domain/usecases/usecase.dart';

part 'login_param.dart';

class Login implements UseCase<Result<User>, LoginParam> {
  final Authentication authentication;
  final UserRepository userRepository;

  Login({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParam params) async {
    var idResult = await authentication.login(
        email: params.email, password: params.password);

    if (idResult is Success) {
      var userResult = await userRepository.getUser(uid: idResult.resultValue!);

      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(message: final message) => Result.failed(message)
      };
    } else {
      return Result.failed(idResult.errorMassage!);
    }
  }
}
