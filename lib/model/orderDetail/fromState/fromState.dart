import 'package:freezed_annotation/freezed_annotation.dart';

part 'fromState.freezed.dart';
part 'fromState.g.dart';

@freezed
class FromState with _$FromState {
  const factory FromState(
    String? state_name, 
    
  ) = _FromState;

  factory FromState.fromJson(Map<String, dynamic> json) => _$FromStateFromJson(json);
}

