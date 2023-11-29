// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliDoneList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryDoneList _$DeliveryDoneListFromJson(Map<String, dynamic> json) {
  return _DeliveryDoneList.fromJson(json);
}

/// @nodoc
mixin _$DeliveryDoneList {
  bool? get status => throw _privateConstructorUsedError;
  List<DeliveryDone>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryDoneListCopyWith<DeliveryDoneList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryDoneListCopyWith<$Res> {
  factory $DeliveryDoneListCopyWith(
          DeliveryDoneList value, $Res Function(DeliveryDoneList) then) =
      _$DeliveryDoneListCopyWithImpl<$Res, DeliveryDoneList>;
  @useResult
  $Res call({bool? status, List<DeliveryDone>? data});
}

/// @nodoc
class _$DeliveryDoneListCopyWithImpl<$Res, $Val extends DeliveryDoneList>
    implements $DeliveryDoneListCopyWith<$Res> {
  _$DeliveryDoneListCopyWithImpl(this._value, this._then);

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
              as List<DeliveryDone>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryDoneListCopyWith<$Res>
    implements $DeliveryDoneListCopyWith<$Res> {
  factory _$$_DeliveryDoneListCopyWith(
          _$_DeliveryDoneList value, $Res Function(_$_DeliveryDoneList) then) =
      __$$_DeliveryDoneListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<DeliveryDone>? data});
}

/// @nodoc
class __$$_DeliveryDoneListCopyWithImpl<$Res>
    extends _$DeliveryDoneListCopyWithImpl<$Res, _$_DeliveryDoneList>
    implements _$$_DeliveryDoneListCopyWith<$Res> {
  __$$_DeliveryDoneListCopyWithImpl(
      _$_DeliveryDoneList _value, $Res Function(_$_DeliveryDoneList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_DeliveryDoneList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DeliveryDone>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryDoneList implements _DeliveryDoneList {
  const _$_DeliveryDoneList(this.status, final List<DeliveryDone>? data)
      : _data = data;

  factory _$_DeliveryDoneList.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryDoneListFromJson(json);

  @override
  final bool? status;
  final List<DeliveryDone>? _data;
  @override
  List<DeliveryDone>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeliveryDoneList(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryDoneList &&
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
  _$$_DeliveryDoneListCopyWith<_$_DeliveryDoneList> get copyWith =>
      __$$_DeliveryDoneListCopyWithImpl<_$_DeliveryDoneList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryDoneListToJson(
      this,
    );
  }
}

abstract class _DeliveryDoneList implements DeliveryDoneList {
  const factory _DeliveryDoneList(
      final bool? status, final List<DeliveryDone>? data) = _$_DeliveryDoneList;

  factory _DeliveryDoneList.fromJson(Map<String, dynamic> json) =
      _$_DeliveryDoneList.fromJson;

  @override
  bool? get status;
  @override
  List<DeliveryDone>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryDoneListCopyWith<_$_DeliveryDoneList> get copyWith =>
      throw _privateConstructorUsedError;
}
