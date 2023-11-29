// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToState _$ToStateFromJson(Map<String, dynamic> json) {
  return _ToState.fromJson(json);
}

/// @nodoc
mixin _$ToState {
  String? get state_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToStateCopyWith<ToState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToStateCopyWith<$Res> {
  factory $ToStateCopyWith(ToState value, $Res Function(ToState) then) =
      _$ToStateCopyWithImpl<$Res, ToState>;
  @useResult
  $Res call({String? state_name});
}

/// @nodoc
class _$ToStateCopyWithImpl<$Res, $Val extends ToState>
    implements $ToStateCopyWith<$Res> {
  _$ToStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state_name = freezed,
  }) {
    return _then(_value.copyWith(
      state_name: freezed == state_name
          ? _value.state_name
          : state_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ToStateCopyWith<$Res> implements $ToStateCopyWith<$Res> {
  factory _$$_ToStateCopyWith(
          _$_ToState value, $Res Function(_$_ToState) then) =
      __$$_ToStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? state_name});
}

/// @nodoc
class __$$_ToStateCopyWithImpl<$Res>
    extends _$ToStateCopyWithImpl<$Res, _$_ToState>
    implements _$$_ToStateCopyWith<$Res> {
  __$$_ToStateCopyWithImpl(_$_ToState _value, $Res Function(_$_ToState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state_name = freezed,
  }) {
    return _then(_$_ToState(
      freezed == state_name
          ? _value.state_name
          : state_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToState implements _ToState {
  const _$_ToState(this.state_name);

  factory _$_ToState.fromJson(Map<String, dynamic> json) =>
      _$$_ToStateFromJson(json);

  @override
  final String? state_name;

  @override
  String toString() {
    return 'ToState(state_name: $state_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToState &&
            (identical(other.state_name, state_name) ||
                other.state_name == state_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToStateCopyWith<_$_ToState> get copyWith =>
      __$$_ToStateCopyWithImpl<_$_ToState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToStateToJson(
      this,
    );
  }
}

abstract class _ToState implements ToState {
  const factory _ToState(final String? state_name) = _$_ToState;

  factory _ToState.fromJson(Map<String, dynamic> json) = _$_ToState.fromJson;

  @override
  String? get state_name;
  @override
  @JsonKey(ignore: true)
  _$$_ToStateCopyWith<_$_ToState> get copyWith =>
      throw _privateConstructorUsedError;
}
