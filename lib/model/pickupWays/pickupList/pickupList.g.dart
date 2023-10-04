// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickupList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PickupList _$$_PickupListFromJson(Map<String, dynamic> json) =>
    _$_PickupList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => PickupWays.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['date'] as String?,
      json['clinet'] as String?,
    );

Map<String, dynamic> _$$_PickupListToJson(_$_PickupList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'date': instance.date,
      'clinet': instance.clinet,
    };
