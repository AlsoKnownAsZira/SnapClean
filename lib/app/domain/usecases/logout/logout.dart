import 'package:snapclean/app/data/repositories/authentication.dart';
import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
}
