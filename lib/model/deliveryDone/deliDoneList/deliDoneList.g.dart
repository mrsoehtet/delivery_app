// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliDoneList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryDoneList _$$_DeliveryDoneListFromJson(Map<String, dynamic> json) =>
    _$_DeliveryDoneList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DeliveryDone.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DeliveryDoneListToJson(_$_DeliveryDoneList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
