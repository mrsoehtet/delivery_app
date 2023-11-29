// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clientCode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientCode _$ClientCodeFromJson(Map<String, dynamic> json) {
  return _ClientCode.fromJson(json);
}

/// @nodoc
mixin _$ClientCode {
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientCodeCopyWith<ClientCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCodeCopyWith<$Res> {
  factory $ClientCodeCopyWith(
          ClientCode value, $Res Function(ClientCode) then) =
      _$ClientCodeCopyWithImpl<$Res, ClientCode>;
  @useResult
  $Res call({String? code});
}

/// @nodoc
class _$ClientCodeCopyWithImpl<$Res, $Val extends ClientCode>
    implements $ClientCodeCopyWith<$Res> {
  _$ClientCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClientCodeCopyWith<$Res>
    implements $ClientCodeCopyWith<$Res> {
  factory _$$_ClientCodeCopyWith(
          _$_ClientCode value, $Res Function(_$_ClientCode) then) =
      __$$_ClientCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code});
}

/// @nodoc
class __$$_ClientCodeCopyWithImpl<$Res>
    extends _$ClientCodeCopyWithImpl<$Res, _$_ClientCode>
    implements _$$_ClientCodeCopyWith<$Res> {
  __$$_ClientCodeCopyWithImpl(
      _$_ClientCode _value, $Res Function(_$_ClientCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_$_ClientCode(
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientCode implements _ClientCode {
  const _$_ClientCode(this.code);

  factory _$_ClientCode.fromJson(Map<String, dynamic> json) =>
      _$$_ClientCodeFromJson(json);

  @override
  final String? code;

  @override
  String toString() {
    return 'ClientCode(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientCode &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientCodeCopyWith<_$_ClientCode> get copyWith =>
      __$$_ClientCodeCopyWithImpl<_$_ClientCode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientCodeToJson(
      this,
    );
  }
}

abstract class _ClientCode implements ClientCode {
  const factory _ClientCode(final String? code) = _$_ClientCode;

  factory _ClientCode.fromJson(Map<String, dynamic> json) =
      _$_ClientCode.fromJson;

  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_ClientCodeCopyWith<_$_ClientCode> get copyWith =>
      throw _privateConstructorUsedError;
}
