// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_ways.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PickupWays _$$_PickupWaysFromJson(Map<String, dynamic> json) =>
    _$_PickupWays(
      json['id'] as int?,
      json['request_id'] as String?,
      json['order_id'] as String?,
      json['order_code'] as String?,
      json['delimen_id'] as String?,
      json['accept_datetime'] as String?,
      json['picked_up_date_time'] as String?,
      json['photo_1'] as String?,
      json['status'] as String?,
      json['delimen_note'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['to_name'] as String?,
      json['item_info'] as String?,
    );

Map<String, dynamic> _$$_PickupWaysToJson(_$_PickupWays instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_id': instance.request_id,
      'order_id': instance.order_id,
      'order_code': instance.order_code,
      'delimen_id': instance.delimen_id,
      'accept_datetime': instance.accept_datetime,
      'picked_up_date_time': instance.picked_up_date_time,
      'photo_1': instance.photo_1,
      'status': instance.status,
      'delimen_note': instance.delimen_note,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'to_name': instance.to_name,
      'item_info': instance.item_info,
    };
