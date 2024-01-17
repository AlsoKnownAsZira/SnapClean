// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String? get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  int? get transactionTime => throw _privateConstructorUsedError;
  String? get transactionImage => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  dynamic get point => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get option => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String? id,
      String uid,
      int? transactionTime,
      String? transactionImage,
      int status,
      dynamic point,
      String address,
      String option,
      String description,
      int total});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? transactionTime = freezed,
    Object? transactionImage = freezed,
    Object? status = null,
    Object? point = freezed,
    Object? address = null,
    Object? option = null,
    Object? description = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTime: freezed == transactionTime
          ? _value.transactionTime
          : transactionTime // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionImage: freezed == transactionImage
          ? _value.transactionImage
          : transactionImage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String uid,
      int? transactionTime,
      String? transactionImage,
      int status,
      dynamic point,
      String address,
      String option,
      String description,
      int total});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? transactionTime = freezed,
    Object? transactionImage = freezed,
    Object? status = null,
    Object? point = freezed,
    Object? address = null,
    Object? option = null,
    Object? description = null,
    Object? total = null,
  }) {
    return _then(_$TransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTime: freezed == transactionTime
          ? _value.transactionTime
          : transactionTime // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionImage: freezed == transactionImage
          ? _value.transactionImage
          : transactionImage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      point: freezed == point ? _value.point! : point,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  _$TransactionImpl(
      {this.id,
      required this.uid,
      this.transactionTime,
      this.transactionImage,
      this.status = 0,
      this.point = 0,
      required this.address,
      required this.option,
      required this.description,
      required this.total});

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String? id;
  @override
  final String uid;
  @override
  final int? transactionTime;
  @override
  final String? transactionImage;
  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey()
  final dynamic point;
  @override
  final String address;
  @override
  final String option;
  @override
  final String description;
  @override
  final int total;

  @override
  String toString() {
    return 'Transaction(id: $id, uid: $uid, transactionTime: $transactionTime, transactionImage: $transactionImage, status: $status, point: $point, address: $address, option: $option, description: $description, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.transactionTime, transactionTime) ||
                other.transactionTime == transactionTime) &&
            (identical(other.transactionImage, transactionImage) ||
                other.transactionImage == transactionImage) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.point, point) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.option, option) || other.option == option) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      transactionTime,
      transactionImage,
      status,
      const DeepCollectionEquality().hash(point),
      address,
      option,
      description,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  factory _Transaction(
      {final String? id,
      required final String uid,
      final int? transactionTime,
      final String? transactionImage,
      final int status,
      final dynamic point,
      required final String address,
      required final String option,
      required final String description,
      required final int total}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String? get id;
  @override
  String get uid;
  @override
  int? get transactionTime;
  @override
  String? get transactionImage;
  @override
  int get status;
  @override
  dynamic get point;
  @override
  String get address;
  @override
  String get option;
  @override
  String get description;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
