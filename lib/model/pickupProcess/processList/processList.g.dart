// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProcessList _$$_ProcessListFromJson(Map<String, dynamic> json) =>
    _$_ProcessList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Process.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProcessListToJson(_$_ProcessList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
