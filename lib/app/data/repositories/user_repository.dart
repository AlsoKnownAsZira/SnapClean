import 'dart:io';

import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    String? address,
  });

  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required User user});
  Future<Result<int>> getUserPoint({required String uid});
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile});
  Future<Result<User>> uploadAddress(
      {required User user, required String address});
}
