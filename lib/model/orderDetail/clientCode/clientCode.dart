import 'package:freezed_annotation/freezed_annotation.dart';

part 'clientCode.freezed.dart';
part 'clientCode.g.dart';

@freezed
class ClientCode with _$ClientCode {
  const factory ClientCode(
    String? code, 
    
  ) = _ClientCode;

  factory ClientCode.fromJson(Map<String, dynamic> json) => _$ClientCodeFromJson(json);
}

