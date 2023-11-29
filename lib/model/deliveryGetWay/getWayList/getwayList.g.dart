// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getwayList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetWayList _$$_GetWayListFromJson(Map<String, dynamic> json) =>
    _$_GetWayList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => GetWay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetWayListToJson(_$_GetWayList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
