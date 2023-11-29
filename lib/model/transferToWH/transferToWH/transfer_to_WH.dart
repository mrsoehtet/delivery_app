import 'package:freezed_annotation/freezed_annotation.dart';
part 'transfer_to_WH.freezed.dart';
part 'transfer_to_WH.g.dart';



@freezed
class TransferToWH with _$TransferToWH {
  const factory TransferToWH(
    int? id,
    String? date,
    int? package_id,
    String? from_warehouse,
    String? no_of_ways,
    String? to_warehouse,
    String? status,
  ) = _TransferToWH;

  factory TransferToWH.fromJson(Map<String, dynamic> json) =>
      _$TransferToWHFromJson(json);
}
