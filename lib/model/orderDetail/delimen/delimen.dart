import 'package:freezed_annotation/freezed_annotation.dart';

part 'delimen.freezed.dart';
part 'delimen.g.dart';

@freezed
class Delimen with _$Delimen {
  const factory Delimen(
    String? full_name, 
    
  ) = _Delimen;

  factory Delimen.fromJson(Map<String, dynamic> json) => _$DelimenFromJson(json);
}

