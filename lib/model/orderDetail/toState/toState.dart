import 'package:freezed_annotation/freezed_annotation.dart';

part 'toState.freezed.dart';
part 'toState.g.dart';

@freezed
class ToState with _$ToState {
  const factory ToState(
    String? state_name, 
    
  ) = _ToState;

  factory ToState.fromJson(Map<String, dynamic> json) => _$ToStateFromJson(json);
}

