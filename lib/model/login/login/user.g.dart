// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      json['id'] as int?,
      json['full_name'] as String?,
      json['User_name'] as String?,
      json['password'] as String?,
      json['phone'] as String?,
      json['address'] as String?,
      json['state'] as String?,
      json['township'] as String?,
      json['zone'] as String?,
      json['branch_id'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.full_name,
      'User_name': instance.User_name,
      'password': instance.password,
      'phone': instance.phone,
      'address': instance.address,
      'state': instance.state,
      'township': instance.township,
      'zone': instance.zone,
      'branch_id': instance.branch_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
