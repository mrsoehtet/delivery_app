// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Request _$$_RequestFromJson(Map<String, dynamic> json) => _$_Request(
      json['id'] as int?,
      json['client_id'] as String?,
      json['name'] as String?,
      json['phone'] as String?,
      json['address'] as String?,
      json['township'] as String?,
      json['state'] as String?,
      json['can_pickup_date'] as String?,
      json['delimen_id'] as String?,
      json['branch_id'] as String?,
      json['assign_date'] as String?,
      json['no_of_way'] as String?,
      json['status'] as String?,
      json['state_name'] as String?,
    );

Map<String, dynamic> _$$_RequestToJson(_$_Request instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_id': instance.client_id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'township': instance.township,
      'state': instance.state,
      'can_pickup_date': instance.can_pickup_date,
      'delimen_id': instance.delimen_id,
      'branch_id': instance.branch_id,
      'assign_date': instance.assign_date,
      'no_of_way': instance.no_of_way,
      'status': instance.status,
      'state_name': instance.state_name,
    };
