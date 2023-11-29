
import 'package:delivery_app/model/deliveryDone/delidone/delidone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'deliDoneList.freezed.dart';
part 'deliDoneList.g.dart';

@freezed
class DeliveryDoneList with _$DeliveryDoneList {
  const factory DeliveryDoneList(
    bool? status,
    List<DeliveryDone>? data,
    
  ) = _DeliveryDoneList;

  factory DeliveryDoneList.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDoneListFromJson(json);
}
