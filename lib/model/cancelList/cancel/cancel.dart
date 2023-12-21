import 'package:freezed_annotation/freezed_annotation.dart';
part 'cancel.freezed.dart';
part 'cancel.g.dart';

@freezed
class Cancel with _$Cancel {
  const factory Cancel(
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
    String? esign,
    String? created_at,
    String? updated_at,
    String? c_id,
    String? c_date,
    String? client_id,
    String? client_name,
  ) = _Cancel;

  factory Cancel.fromJson(Map<String, dynamic> json) =>
      _$CancelFromJson(json);
}
