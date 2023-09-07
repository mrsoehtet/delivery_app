import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class Request with _$Request {
  const factory Request(
    int? id,
    String? client_id,
    String? name,
    String? phone,
    String? address,
    String? township,
    String? state,
    String? can_pickup_date,
    String? delimen_id,
    String? branch_id,
    String? assign_date,
    String? no_of_way,
    String? status,
    String? state_name,
  ) = _Request;

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
}
