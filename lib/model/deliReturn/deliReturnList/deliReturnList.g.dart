// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliReturnList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryReturnList _$$_DeliveryReturnListFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryReturnList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DeliveryReturn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DeliveryReturnListToJson(
        _$_DeliveryReturnList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
