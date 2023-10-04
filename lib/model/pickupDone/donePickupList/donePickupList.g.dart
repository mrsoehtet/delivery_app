// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donePickupList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DonePickupList _$$_DonePickupListFromJson(Map<String, dynamic> json) =>
    _$_DonePickupList(
      json['status'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DonePickup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DonePickupListToJson(_$_DonePickupList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
