import 'package:delivery_app/model/deliveryGetWay/deliverygetWay/getway.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'getwayList.freezed.dart';
part 'getwayList.g.dart';

@freezed
class GetWayList with _$GetWayList {
  const factory GetWayList(
    bool? status,
    List<GetWay>? data,
    
  ) = _GetWayList;

  factory GetWayList.fromJson(Map<String, dynamic> json) =>
      _$GetWayListFromJson(json);
}
