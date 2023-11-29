import 'package:delivery_app/model/deliveryProcessList/deliProcess/deliProcess.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'deliProcessList.freezed.dart';
part 'deliProcessList.g.dart';

@freezed
class DeliveryProcessList with _$DeliveryProcessList {
  const factory DeliveryProcessList(
    bool? status,
    List<DeliveryProcess>? data,
    
  ) = _DeliveryProcessList;

  factory DeliveryProcessList.fromJson(Map<String, dynamic> json) =>
      _$DeliveryProcessListFromJson(json);
}
