
import 'package:delivery_app/model/deliReturn/delireturn/delireturn.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'deliReturnList.freezed.dart';
part 'deliReturnList.g.dart';

@freezed
class DeliveryReturnList with _$DeliveryReturnList {
  const factory DeliveryReturnList(
    bool? status,
    List<DeliveryReturn>? data,
    
  ) = _DeliveryReturnList;

  factory DeliveryReturnList.fromJson(Map<String, dynamic> json) =>
      _$DeliveryReturnListFromJson(json);
}
