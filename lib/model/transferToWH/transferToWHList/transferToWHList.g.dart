// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferToWHList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferToWHList _$$_TransferToWHListFromJson(Map<String, dynamic> json) =>
    _$_TransferToWHList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => TransferToWH.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TransferToWHListToJson(_$_TransferToWHList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
