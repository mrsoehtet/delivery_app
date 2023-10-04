import 'package:freezed_annotation/freezed_annotation.dart';

part 'pickup_ways.freezed.dart';
part 'pickup_ways.g.dart';

@freezed
class PickupWays with _$PickupWays {
  const factory PickupWays(
    int? id,
    String? request_id,
    String? order_id,
    String? order_code,
    String? delimen_id,
    String? accept_datetime,
    String? picked_up_date_time,
    String? photo_1,
    String? status,
    String? delimen_note,
    String? created_at,
    String? updated_at,
    String? to_name,
    String? item_info,
  ) = _PickupWays;

  factory PickupWays.fromJson(Map<String, dynamic> json) =>
      _$PickupWaysFromJson(json);
}

/*
               "id": 17,
            "PickupWays_id": "54",
            "order_id": "19",
            "order_code": "11-230019-11",
            "delimen_id": "1",
            "accept_datetime": "2023-09-20 08:57:33",
            "picked_up_date_time": "2023-09-20 13:27:33",
            "photo_1": null,
            "photo_2": null,
            "photo_3": null,
            "status": "2",
            "delimen_note": null,
            "created_at": "2023-09-20T06:57:33.000000Z",
            "updated_at": "2023-09-20T06:57:33.000000Z",
            "to_name": "RRRR",
            "item_info": "s"
*/