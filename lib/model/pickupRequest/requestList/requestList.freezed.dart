// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requestList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestList _$RequestListFromJson(Map<String, dynamic> json) {
  return _RequestList.fromJson(json);
}

/// @nodoc
mixin _$RequestList {
  bool? get status => throw _privateConstructorUsedError;
  List<Request>? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestListCopyWith<RequestList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListCopyWith<$Res> {
  factory $RequestListCopyWith(
          RequestList value, $Res Function(RequestList) then) =
      _$RequestListCopyWithImpl<$Res, RequestList>;
  @useResult
  $Res call({bool? status, List<Request>? data, String? message});
}

/// @nodoc
class _$RequestListCopyWithImpl<$Res, $Val extends RequestList>
    implements $RequestListCopyWith<$Res> {
  _$RequestListCopyWithImpl(this._value, this._then);

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
              as List<Request>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestListCopyWith<$Res>
    implements $RequestListCopyWith<$Res> {
  factory _$$_RequestListCopyWith(
          _$_RequestList value, $Res Function(_$_RequestList) then) =
      __$$_RequestListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<Request>? data, String? message});
}

/// @nodoc
class __$$_RequestListCopyWithImpl<$Res>
    extends _$RequestListCopyWithImpl<$Res, _$_RequestList>
    implements _$$_RequestListCopyWith<$Res> {
  __$$_RequestListCopyWithImpl(
      _$_RequestList _value, $Res Function(_$_RequestList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_RequestList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Request>?,
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestList implements _RequestList {
  const _$_RequestList(this.status, final List<Request>? data, this.message)
      : _data = data;

  factory _$_RequestList.fromJson(Map<String, dynamic> json) =>
      _$$_RequestListFromJson(json);

  @override
  final bool? status;
  final List<Request>? _data;
  @override
  List<Request>? get data {
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
    return 'RequestList(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestList &&
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
  _$$_RequestListCopyWith<_$_RequestList> get copyWith =>
      __$$_RequestListCopyWithImpl<_$_RequestList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestListToJson(
      this,
    );
  }
}

abstract class _RequestList implements RequestList {
  const factory _RequestList(final bool? status, final List<Request>? data,
      final String? message) = _$_RequestList;

  factory _RequestList.fromJson(Map<String, dynamic> json) =
      _$_RequestList.fromJson;

  @override
  bool? get status;
  @override
  List<Request>? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_RequestListCopyWith<_$_RequestList> get copyWith =>
      throw _privateConstructorUsedError;
}
