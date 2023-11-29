import 'package:delivery_app/model/orderDetail/clientCode/clientCode.dart';
import 'package:delivery_app/model/orderDetail/delimen/delimen.dart';
import 'package:delivery_app/model/orderDetail/fromState/fromState.dart';
import 'package:delivery_app/model/orderDetail/orderDetail/orderDetail.dart';
import 'package:delivery_app/model/orderDetail/toState/toState.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'orderDetailList.freezed.dart';
part 'orderDetailList.g.dart';

@freezed
class OrderDetailList with _$OrderDetailList {
  const factory OrderDetailList(
    bool? status,
    OrderDetail? order,
    ClientCode? client_code,
    Delimen? delimen,
    FromState? from_state,
    ToState? to_state,
    String? message,
  ) = _OrderDetailList;

  factory OrderDetailList.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailListFromJson(json);
}
