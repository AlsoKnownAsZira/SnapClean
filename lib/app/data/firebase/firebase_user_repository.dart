import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:snapclean/app/data/repositories/user_repository.dart';
import 'package:snapclean/app/domain/entities/result.dart';
import 'package:snapclean/app/domain/entities/user.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<User>> createUser(
      {required String uid,
      required String email,
      required String name,
      String? photoUrl,
      String? address,
      int point = 0}) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection('users');

    await users.doc(uid).set({
      "uid": uid,
      "email": email,
      "name": name,
      "photoUrl": photoUrl,
      "address": address,
      "point": point
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed('Failed to create user');
    }
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed("User not found");
    }
  }

  @override
  Future<Result<int>> getUserPoint({required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      return Result.success(result.data()!['balance']);
    } else {
      return const Result.failed('User not found');
    }
  }

  @override
  Future<Result<User>> updateUser({required User user}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firebaseFirestore.doc('users/${user.uid}');

      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();

      if (result.exists) {
        User userUpdate = User.fromJson(result.data()!);
        if (userUpdate == user) {
          return Result.success(userUpdate);
        } else {
          return const Result.failed('Failed to update user data');
        }
      } else {
        return const Result.failed('Failed to update user data');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to update user data');
    }
  }

  @override
  Future<Result<User>> updateUserPoint(
      {required String uid, required int point}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      await documentReference.update({'point': point});

      DocumentSnapshot<Map<String, dynamic>> updatedResult =
          await documentReference.get();

      if (updatedResult.exists) {
        User updatedUser = User.fromJson(result.data()!);
        if (updatedUser.point == point) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to update user balance');
        }
      } else {
        return const Result.failed('Failed to retrieve updated user balence');
      }
    } else {
      return const Result.failed('User not found');
    }
  }

  @override
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile}) async {
    // Mengambil file name photo
    String fileName = basename(imageFile.path);

    Reference reference = FirebaseStorage.instance.ref().child(fileName);

    try {
      await reference.putFile(imageFile);

      String downloadUrl = await reference.getDownloadURL();

      var updateResult =
          await updateUser(user: user.copyWith(photoUrl: downloadUrl));

      if (updateResult.isSucces) {
        return Result.success(updateResult.resultValue!);
      } else {
        return Result.failed(updateResult.errorMassage!);
      }
    } catch (e) {
      return const Result.failed('Failed to upload profile picture');
    }
  }

  @override
  Future<Result<User>> uploadAddress(
      {required User user, required String address}) {
    // TODO: implement uploadAddress
    throw UnimplementedError();
  }
}
