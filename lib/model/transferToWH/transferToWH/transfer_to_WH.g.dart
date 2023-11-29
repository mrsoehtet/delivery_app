// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_to_WH.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferToWH _$$_TransferToWHFromJson(Map<String, dynamic> json) =>
    _$_TransferToWH(
      json['id'] as int?,
      json['date'] as String?,
      json['package_id'] as int?,
      json['from_warehouse'] as String?,
      json['no_of_ways'] as String?,
      json['to_warehouse'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$$_TransferToWHToJson(_$_TransferToWH instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'package_id': instance.package_id,
      'from_warehouse': instance.from_warehouse,
      'no_of_ways': instance.no_of_ways,
      'to_warehouse': instance.to_warehouse,
      'status': instance.status,
    };
