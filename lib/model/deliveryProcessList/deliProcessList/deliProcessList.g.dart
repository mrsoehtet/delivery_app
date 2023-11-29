// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliProcessList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryProcessList _$$_DeliveryProcessListFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryProcessList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DeliveryProcess.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DeliveryProcessListToJson(
        _$_DeliveryProcessList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
