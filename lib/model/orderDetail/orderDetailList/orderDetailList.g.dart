// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetailList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetailList _$$_OrderDetailListFromJson(Map<String, dynamic> json) =>
    _$_OrderDetailList(
      json['status'] as bool?,
      json['order'] == null
          ? null
          : OrderDetail.fromJson(json['order'] as Map<String, dynamic>),
      json['client_code'] == null
          ? null
          : ClientCode.fromJson(json['client_code'] as Map<String, dynamic>),
      json['delimen'] == null
          ? null
          : Delimen.fromJson(json['delimen'] as Map<String, dynamic>),
      json['from_state'] == null
          ? null
          : FromState.fromJson(json['from_state'] as Map<String, dynamic>),
      json['to_state'] == null
          ? null
          : ToState.fromJson(json['to_state'] as Map<String, dynamic>),
      json['image_url'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$$_OrderDetailListToJson(_$_OrderDetailList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'order': instance.order,
      'client_code': instance.client_code,
      'delimen': instance.delimen,
      'from_state': instance.from_state,
      'to_state': instance.to_state,
      'image_url': instance.image_url,
      'message': instance.message,
    };
