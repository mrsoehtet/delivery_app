// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requestList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestList _$$_RequestListFromJson(Map<String, dynamic> json) =>
    _$_RequestList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Request.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$$_RequestListToJson(_$_RequestList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
