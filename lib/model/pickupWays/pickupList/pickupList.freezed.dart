// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickupList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PickupList _$PickupListFromJson(Map<String, dynamic> json) {
  return _PickupList.fromJson(json);
}

/// @nodoc
mixin _$PickupList {
  bool? get status => throw _privateConstructorUsedError;
  List<PickupWays>? get data => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get clinet => throw _privateConstructorUsedError;
  String? get image_url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PickupListCopyWith<PickupList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupListCopyWith<$Res> {
  factory $PickupListCopyWith(
          PickupList value, $Res Function(PickupList) then) =
      _$PickupListCopyWithImpl<$Res, PickupList>;
  @useResult
  $Res call(
      {bool? status,
      List<PickupWays>? data,
      String? date,
      String? clinet,
      String? image_url});
}

/// @nodoc
class _$PickupListCopyWithImpl<$Res, $Val extends PickupList>
    implements $PickupListCopyWith<$Res> {
  _$PickupListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? date = freezed,
    Object? clinet = freezed,
    Object? image_url = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PickupWays>?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      clinet: freezed == clinet
          ? _value.clinet
          : clinet // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PickupListCopyWith<$Res>
    implements $PickupListCopyWith<$Res> {
  factory _$$_PickupListCopyWith(
          _$_PickupList value, $Res Function(_$_PickupList) then) =
      __$$_PickupListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      List<PickupWays>? data,
      String? date,
      String? clinet,
      String? image_url});
}

/// @nodoc
class __$$_PickupListCopyWithImpl<$Res>
    extends _$PickupListCopyWithImpl<$Res, _$_PickupList>
    implements _$$_PickupListCopyWith<$Res> {
  __$$_PickupListCopyWithImpl(
      _$_PickupList _value, $Res Function(_$_PickupList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? date = freezed,
    Object? clinet = freezed,
    Object? image_url = freezed,
  }) {
    return _then(_$_PickupList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PickupWays>?,
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == clinet
          ? _value.clinet
          : clinet // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PickupList implements _PickupList {
  const _$_PickupList(this.status, final List<PickupWays>? data, this.date,
      this.clinet, this.image_url)
      : _data = data;

  factory _$_PickupList.fromJson(Map<String, dynamic> json) =>
      _$$_PickupListFromJson(json);

  @override
  final bool? status;
  final List<PickupWays>? _data;
  @override
  List<PickupWays>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? date;
  @override
  final String? clinet;
  @override
  final String? image_url;

  @override
  String toString() {
    return 'PickupList(status: $status, data: $data, date: $date, clinet: $clinet, image_url: $image_url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PickupList &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.clinet, clinet) || other.clinet == clinet) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_data), date, clinet, image_url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PickupListCopyWith<_$_PickupList> get copyWith =>
      __$$_PickupListCopyWithImpl<_$_PickupList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PickupListToJson(
      this,
    );
  }
}

abstract class _PickupList implements PickupList {
  const factory _PickupList(
      final bool? status,
      final List<PickupWays>? data,
      final String? date,
      final String? clinet,
      final String? image_url) = _$_PickupList;

  factory _PickupList.fromJson(Map<String, dynamic> json) =
      _$_PickupList.fromJson;

  @override
  bool? get status;
  @override
  List<PickupWays>? get data;
  @override
  String? get date;
  @override
  String? get clinet;
  @override
  String? get image_url;
  @override
  @JsonKey(ignore: true)
  _$$_PickupListCopyWith<_$_PickupList> get copyWith =>
      throw _privateConstructorUsedError;
}
