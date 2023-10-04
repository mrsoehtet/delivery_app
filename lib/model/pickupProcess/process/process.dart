import 'package:freezed_annotation/freezed_annotation.dart';

part 'process.freezed.dart';
part 'process.g.dart';

@freezed
class Process with _$Process {
  const factory Process(
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
  ) = _Process;

  factory Process.fromJson(Map<String, dynamic> json) =>
      _$ProcessFromJson(json);
}

/*
            "id": 53,
            "request_id": "55",
            "order_id": "44",
            "order_code": "11-230044-50",
            "delimen_id": "1",
            "accept_datetime": "2023-09-27 07:40:28",
            "picked_up_date_time": "2023-09-27 12:10:28",
            "photo_1": null,
            "photo_2": null,
            "photo_3": null,
            "status": "2",
            "delimen_note": null,
            "created_at": "2023-09-27T05:40:28.000000Z",
            "updated_at": "2023-09-27T05:40:28.000000Z",
            "state_name": "Yangon",
            "from_name": "Client Name",
            "from_phone": "09421011543",
            "from_addres": "No.1, Sample Street, 5 ward",
            "from_township": "Dagon"
        },
       
*/
