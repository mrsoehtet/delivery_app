import 'package:freezed_annotation/freezed_annotation.dart';

part 'donePickup.freezed.dart';
part 'donePickup.g.dart';

@freezed
class DonePickup with _$DonePickup {
  const factory DonePickup(
    int? id,
    String? request_id,
    String? order_id,
    String? order_code,
    String? delimen_id,
    String? accept_datetime,
    String? picked_up_date_time,
    String? can_pickup_date,
    String? photo_1,
    String? status,
    String? delimen_note,
    String? created_at,
    String? updated_at,
    String? state_name,
    String? from_name,
    String? from_phone,
    String? from_addres,
    String? from_township,
  ) = _DonePickup;

  factory DonePickup.fromJson(Map<String, dynamic> json) =>
      _$DonePickupFromJson(json);
}

/*
         
        
        {
            "id": 10,
            "request_id": "49",
            "order_id": "12",
            "order_code": "11-230008-11",
            "delimen_id": "1",
            "accept_datetime": "2023-08-16 17:29:13",
            "picked_up_date_time": "2023-08-16 21:57:30",
            "photo_1": null,
            "photo_2": null,
            "photo_3": null,
            "status": "3",
            "delimen_note": null,
            "created_at": "2023-08-16T10:57:30.000000Z",
            "updated_at": "2023-08-16T10:59:13.000000Z",
            "state_name": "Yangon",
            "from_name": "Client Name",
            "from_phone": "09421011543",
            "from_addres": "No.1, Sample Street, 5 ward",
            "from_township": "Dagon"
       
*/
