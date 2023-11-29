// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getwayList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetWayList _$GetWayListFromJson(Map<String, dynamic> json) {
  return _GetWayList.fromJson(json);
}

/// @nodoc
mixin _$GetWayList {
  bool? get status => throw _privateConstructorUsedError;
  List<GetWay>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetWayListCopyWith<GetWayList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWayListCopyWith<$Res> {
  factory $GetWayListCopyWith(
          GetWayList value, $Res Function(GetWayList) then) =
      _$GetWayListCopyWithImpl<$Res, GetWayList>;
  @useResult
  $Res call({bool? status, List<GetWay>? data});
}

/// @nodoc
class _$GetWayListCopyWithImpl<$Res, $Val extends GetWayList>
    implements $GetWayListCopyWith<$Res> {
  _$GetWayListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetWay>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetWayListCopyWith<$Res>
    implements $GetWayListCopyWith<$Res> {
  factory _$$_GetWayListCopyWith(
          _$_GetWayList value, $Res Function(_$_GetWayList) then) =
      __$$_GetWayListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<GetWay>? data});
}

/// @nodoc
class __$$_GetWayListCopyWithImpl<$Res>
    extends _$GetWayListCopyWithImpl<$Res, _$_GetWayList>
    implements _$$_GetWayListCopyWith<$Res> {
  __$$_GetWayListCopyWithImpl(
      _$_GetWayList _value, $Res Function(_$_GetWayList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_GetWayList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetWay>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetWayList implements _GetWayList {
  const _$_GetWayList(this.status, final List<GetWay>? data) : _data = data;

  factory _$_GetWayList.fromJson(Map<String, dynamic> json) =>
      _$$_GetWayListFromJson(json);

  @override
  final bool? status;
  final List<GetWay>? _data;
  @override
  List<GetWay>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetWayList(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetWayList &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetWayListCopyWith<_$_GetWayList> get copyWith =>
      __$$_GetWayListCopyWithImpl<_$_GetWayList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetWayListToJson(
      this,
    );
  }
}

abstract class _GetWayList implements GetWayList {
  const factory _GetWayList(final bool? status, final List<GetWay>? data) =
      _$_GetWayList;

  factory _GetWayList.fromJson(Map<String, dynamic> json) =
      _$_GetWayList.fromJson;

  @override
  bool? get status;
  @override
  List<GetWay>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_GetWayListCopyWith<_$_GetWayList> get copyWith =>
      throw _privateConstructorUsedError;
}
