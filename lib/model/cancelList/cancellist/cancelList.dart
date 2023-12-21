
import 'package:delivery_app/model/cancelList/cancel/cancel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cancelList.freezed.dart';
part 'cancelList.g.dart';

@freezed
class CancelList with _$CancelList {
  const factory CancelList(
    bool? status,
    List<Cancel>? data,
    String? message,
    
  ) = _CancelList;

  factory CancelList.fromJson(Map<String, dynamic> json) =>
      _$CancelListFromJson(json);
}
