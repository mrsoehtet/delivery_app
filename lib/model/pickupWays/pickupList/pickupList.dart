import 'package:delivery_app/model/pickupWays/pickup_ways/pickup_ways.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pickupList.freezed.dart';
part 'pickupList.g.dart';

@freezed
class PickupList with _$PickupList {
  const factory PickupList(
    bool? status,
    List<PickupWays>? data,
    String? date,
    String? clinet,
    String? image_url,
  ) = _PickupList;

  factory PickupList.fromJson(Map<String, dynamic> json) =>
      _$PickupListFromJson(json);
}
