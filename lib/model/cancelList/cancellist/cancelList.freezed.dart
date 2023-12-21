// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancelList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CancelList _$CancelListFromJson(Map<String, dynamic> json) {
  return _CancelList.fromJson(json);
}

/// @nodoc
mixin _$CancelList {
  bool? get status => throw _privateConstructorUsedError;
  List<Cancel>? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelListCopyWith<CancelList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelListCopyWith<$Res> {
  factory $CancelListCopyWith(
          CancelList value, $Res Function(CancelList) then) =
      _$CancelListCopyWithImpl<$Res, CancelList>;
  @useResult
  $Res call({bool? status, List<Cancel>? data, String? message});
}

/// @nodoc
class _$CancelListCopyWithImpl<$Res, $Val extends CancelList>
    implements $CancelListCopyWith<$Res> {
  _$CancelListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Cancel>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CancelListCopyWith<$Res>
    implements $CancelListCopyWith<$Res> {
  factory _$$_CancelListCopyWith(
          _$_CancelList value, $Res Function(_$_CancelList) then) =
      __$$_CancelListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<Cancel>? data, String? message});
}

/// @nodoc
class __$$_CancelListCopyWithImpl<$Res>
    extends _$CancelListCopyWithImpl<$Res, _$_CancelList>
    implements _$$_CancelListCopyWith<$Res> {
  __$$_CancelListCopyWithImpl(
      _$_CancelList _value, $Res Function(_$_CancelList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_CancelList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Cancel>?,
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CancelList implements _CancelList {
  const _$_CancelList(this.status, final List<Cancel>? data, this.message)
      : _data = data;

  factory _$_CancelList.fromJson(Map<String, dynamic> json) =>
      _$$_CancelListFromJson(json);

  @override
  final bool? status;
  final List<Cancel>? _data;
  @override
  List<Cancel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'CancelList(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancelList &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CancelListCopyWith<_$_CancelList> get copyWith =>
      __$$_CancelListCopyWithImpl<_$_CancelList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CancelListToJson(
      this,
    );
  }
}

abstract class _CancelList implements CancelList {
  const factory _CancelList(
          final bool? status, final List<Cancel>? data, final String? message) =
      _$_CancelList;

  factory _CancelList.fromJson(Map<String, dynamic> json) =
      _$_CancelList.fromJson;

  @override
  bool? get status;
  @override
  List<Cancel>? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_CancelListCopyWith<_$_CancelList> get copyWith =>
      throw _privateConstructorUsedError;
}
