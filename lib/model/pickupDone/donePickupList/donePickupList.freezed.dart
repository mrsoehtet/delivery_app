// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donePickupList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DonePickupList _$DonePickupListFromJson(Map<String, dynamic> json) {
  return _DonePickupList.fromJson(json);
}

/// @nodoc
mixin _$DonePickupList {
  bool? get status => throw _privateConstructorUsedError;
  List<DonePickup>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonePickupListCopyWith<DonePickupList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonePickupListCopyWith<$Res> {
  factory $DonePickupListCopyWith(
          DonePickupList value, $Res Function(DonePickupList) then) =
      _$DonePickupListCopyWithImpl<$Res, DonePickupList>;
  @useResult
  $Res call({bool? status, List<DonePickup>? data});
}

/// @nodoc
class _$DonePickupListCopyWithImpl<$Res, $Val extends DonePickupList>
    implements $DonePickupListCopyWith<$Res> {
  _$DonePickupListCopyWithImpl(this._value, this._then);

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
              as List<DonePickup>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DonePickupListCopyWith<$Res>
    implements $DonePickupListCopyWith<$Res> {
  factory _$$_DonePickupListCopyWith(
          _$_DonePickupList value, $Res Function(_$_DonePickupList) then) =
      __$$_DonePickupListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<DonePickup>? data});
}

/// @nodoc
class __$$_DonePickupListCopyWithImpl<$Res>
    extends _$DonePickupListCopyWithImpl<$Res, _$_DonePickupList>
    implements _$$_DonePickupListCopyWith<$Res> {
  __$$_DonePickupListCopyWithImpl(
      _$_DonePickupList _value, $Res Function(_$_DonePickupList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_DonePickupList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DonePickup>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DonePickupList implements _DonePickupList {
  const _$_DonePickupList(this.status, final List<DonePickup>? data)
      : _data = data;

  factory _$_DonePickupList.fromJson(Map<String, dynamic> json) =>
      _$$_DonePickupListFromJson(json);

  @override
  final bool? status;
  final List<DonePickup>? _data;
  @override
  List<DonePickup>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DonePickupList(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DonePickupList &&
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
  _$$_DonePickupListCopyWith<_$_DonePickupList> get copyWith =>
      __$$_DonePickupListCopyWithImpl<_$_DonePickupList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DonePickupListToJson(
      this,
    );
  }
}

abstract class _DonePickupList implements DonePickupList {
  const factory _DonePickupList(
      final bool? status, final List<DonePickup>? data) = _$_DonePickupList;

  factory _DonePickupList.fromJson(Map<String, dynamic> json) =
      _$_DonePickupList.fromJson;

  @override
  bool? get status;
  @override
  List<DonePickup>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_DonePickupListCopyWith<_$_DonePickupList> get copyWith =>
      throw _privateConstructorUsedError;
}
