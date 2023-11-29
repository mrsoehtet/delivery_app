// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fromState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FromState _$FromStateFromJson(Map<String, dynamic> json) {
  return _FromState.fromJson(json);
}

/// @nodoc
mixin _$FromState {
  String? get state_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FromStateCopyWith<FromState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromStateCopyWith<$Res> {
  factory $FromStateCopyWith(FromState value, $Res Function(FromState) then) =
      _$FromStateCopyWithImpl<$Res, FromState>;
  @useResult
  $Res call({String? state_name});
}

/// @nodoc
class _$FromStateCopyWithImpl<$Res, $Val extends FromState>
    implements $FromStateCopyWith<$Res> {
  _$FromStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_FromStateCopyWith<$Res> implements $FromStateCopyWith<$Res> {
  factory _$$_FromStateCopyWith(
          _$_FromState value, $Res Function(_$_FromState) then) =
      __$$_FromStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? state_name});
}

/// @nodoc
class __$$_FromStateCopyWithImpl<$Res>
    extends _$FromStateCopyWithImpl<$Res, _$_FromState>
    implements _$$_FromStateCopyWith<$Res> {
  __$$_FromStateCopyWithImpl(
      _$_FromState _value, $Res Function(_$_FromState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state_name = freezed,
  }) {
    return _then(_$_FromState(
      freezed == state_name
          ? _value.state_name
          : state_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FromState implements _FromState {
  const _$_FromState(this.state_name);

  factory _$_FromState.fromJson(Map<String, dynamic> json) =>
      _$$_FromStateFromJson(json);

  @override
  final String? state_name;

  @override
  String toString() {
    return 'FromState(state_name: $state_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FromState &&
            (identical(other.state_name, state_name) ||
                other.state_name == state_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FromStateCopyWith<_$_FromState> get copyWith =>
      __$$_FromStateCopyWithImpl<_$_FromState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FromStateToJson(
      this,
    );
  }
}

abstract class _FromState implements FromState {
  const factory _FromState(final String? state_name) = _$_FromState;

  factory _FromState.fromJson(Map<String, dynamic> json) =
      _$_FromState.fromJson;

  @override
  String? get state_name;
  @override
  @JsonKey(ignore: true)
  _$$_FromStateCopyWith<_$_FromState> get copyWith =>
      throw _privateConstructorUsedError;
}
