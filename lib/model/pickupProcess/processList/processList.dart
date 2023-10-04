import 'package:delivery_app/model/pickupProcess/process/process.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'processList.freezed.dart';
part 'processList.g.dart';

@freezed
class ProcessList with _$ProcessList {
  const factory ProcessList(
    bool? status,
    List<Process>? data,
    
  ) = _ProcessList;

  factory ProcessList.fromJson(Map<String, dynamic> json) =>
      _$ProcessListFromJson(json);
}
