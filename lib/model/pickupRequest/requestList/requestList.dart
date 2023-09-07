import 'package:delivery_app/model/pickupRequest/request/request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'requestList.freezed.dart';
part 'requestList.g.dart';

@freezed
class RequestList with _$RequestList {
  const factory RequestList(
    bool? status,
    List<Request>? data,
    String? message,
  ) = _RequestList;

  factory RequestList.fromJson(Map<String, dynamic> json) =>
      _$RequestListFromJson(json);
}
