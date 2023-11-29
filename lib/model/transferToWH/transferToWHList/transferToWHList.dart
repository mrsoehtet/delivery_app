import 'package:delivery_app/model/transferToWH/transferToWH/transfer_to_WH.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'transferToWHList.freezed.dart';
part 'transferToWHList.g.dart';

@freezed
class TransferToWHList with _$TransferToWHList {
  const factory TransferToWHList(
    bool? status,
    List<TransferToWH>? data,
  ) = _TransferToWHList;

  factory TransferToWHList.fromJson(Map<String, dynamic> json) =>
      _$TransferToWHListFromJson(json);
}
