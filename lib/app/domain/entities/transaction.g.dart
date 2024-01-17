// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String?,
      uid: json['uid'] as String,
      transactionTime: json['transactionTime'] as int?,
      transactionImage: json['transactionImage'] as String?,
      status: json['status'] as int? ?? 0,
      point: json['point'] ?? 0,
      address: json['address'] as String,
      option: json['option'] as String,
      description: json['description'] as String,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'transactionTime': instance.transactionTime,
      'transactionImage': instance.transactionImage,
      'status': instance.status,
      'point': instance.point,
      'address': instance.address,
      'option': instance.option,
      'description': instance.description,
      'total': instance.total,
    };
