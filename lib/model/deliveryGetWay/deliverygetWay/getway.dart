import 'package:freezed_annotation/freezed_annotation.dart';

part 'getway.freezed.dart';
part 'getway.g.dart';

@freezed
class GetWay with _$GetWay {
  const factory GetWay(
    int? id,
    String? order_id,
    String? order_code,
    String? from_name,
    String? from_phone,
    String? from_addres,
    String? from_township,
    String? from_state,
    String? item_info,
    String? number_of_item,
    String? width,
    String? height,
    String? length,
    String? weight,
    String? can_pickup_date,
    String? pay_status,
    String? photo_1,
    String? remark,
    String? to_name,
    String? to_phone,
    String? to_address,
    String? to_township,
    String? to_state,
    String? puckup_fee,
    String? deli_fee,
    String? service_total,
    String? item_amount,
    String? net_total,
    String? payment_method,
    String? system_note,
    String? request_date,
    String? created_at,
    String? updated_at,
    String? pk_id,
    String? pk_date,
    
   
  ) = _GetWay;

  factory GetWay.fromJson(Map<String, dynamic> json) => _$GetWayFromJson(json);
}

/*
           "id": 8,
            "order_id": "12",
            "order_code": "11-230008-11",
            "from_name": "Client Name",
            "from_phone": "09421011543",
            "from_addres": "No.1, Sample Street, 5 ward",
            "from_township": "Dagon",
            "from_state": "12",
            "item_info": "test",
            "number_of_item": "1",
            "width": "25",
            "height": "10",
            "length": "25",
            "weight": "1.00",
            "can_pickup_date": "2023-08-16",
            "pay_status": "Pay Sender",
            "photo_1": "",
            "photo_2": "",
            "photo_3": "",
            "remark": "test",
            "to_name": "test",
            "to_phone": "0934574568",
            "to_address": "test",
            "to_township": "Tamwe",
            "to_state": "12",
            "puckup_fee": "0",
            "deli_fee": "2500",
            "service_total": "2500",
            "item_amount": null,
            "net_total": "2500",
            "payment_method": null,
            "system_note": "",
            "request_date": "2023-08-16 21:55:46",
            "created_at": "2023-08-16T10:54:16.000000Z",
            "updated_at": "2023-08-16T10:57:30.000000Z",
            "pk_id": "16",
            "pk_date": "2023-08-16 17:34:50"
        },
        
       
*/
