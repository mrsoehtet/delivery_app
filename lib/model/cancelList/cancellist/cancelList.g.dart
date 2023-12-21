// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CancelList _$$_CancelListFromJson(Map<String, dynamic> json) =>
    _$_CancelList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Cancel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$$_CancelListToJson(_$_CancelList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
