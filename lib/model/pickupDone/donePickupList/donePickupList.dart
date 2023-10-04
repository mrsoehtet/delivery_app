import 'package:delivery_app/model/pickupDone/done/donePickup.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'donePickupList.freezed.dart';
part 'donePickupList.g.dart';

@freezed
class DonePickupList with _$DonePickupList {
  const factory DonePickupList(
    bool? status,
    List<DonePickup>? data,
    
  ) = _DonePickupList;

  factory DonePickupList.fromJson(Map<String, dynamic> json) =>
      _$DonePickupListFromJson(json);
}
