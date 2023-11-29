// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliReturnList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryReturnList _$DeliveryReturnListFromJson(Map<String, dynamic> json) {
  return _DeliveryReturnList.fromJson(json);
}

/// @nodoc
mixin _$DeliveryReturnList {
  bool? get status => throw _privateConstructorUsedError;
  List<DeliveryReturn>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryReturnListCopyWith<DeliveryReturnList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryReturnListCopyWith<$Res> {
  factory $DeliveryReturnListCopyWith(
          DeliveryReturnList value, $Res Function(DeliveryReturnList) then) =
      _$DeliveryReturnListCopyWithImpl<$Res, DeliveryReturnList>;
  @useResult
  $Res call({bool? status, List<DeliveryReturn>? data});
}

/// @nodoc
class _$DeliveryReturnListCopyWithImpl<$Res, $Val extends DeliveryReturnList>
    implements $DeliveryReturnListCopyWith<$Res> {
  _$DeliveryReturnListCopyWithImpl(this._value, this._then);

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
              as List<DeliveryReturn>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryReturnListCopyWith<$Res>
    implements $DeliveryReturnListCopyWith<$Res> {
  factory _$$_DeliveryReturnListCopyWith(_$_DeliveryReturnList value,
          $Res Function(_$_DeliveryReturnList) then) =
      __$$_DeliveryReturnListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<DeliveryReturn>? data});
}

/// @nodoc
class __$$_DeliveryReturnListCopyWithImpl<$Res>
    extends _$DeliveryReturnListCopyWithImpl<$Res, _$_DeliveryReturnList>
    implements _$$_DeliveryReturnListCopyWith<$Res> {
  __$$_DeliveryReturnListCopyWithImpl(
      _$_DeliveryReturnList _value, $Res Function(_$_DeliveryReturnList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_DeliveryReturnList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DeliveryReturn>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryReturnList implements _DeliveryReturnList {
  const _$_DeliveryReturnList(this.status, final List<DeliveryReturn>? data)
      : _data = data;

  factory _$_DeliveryReturnList.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryReturnListFromJson(json);

  @override
  final bool? status;
  final List<DeliveryReturn>? _data;
  @override
  List<DeliveryReturn>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeliveryReturnList(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryReturnList &&
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
  _$$_DeliveryReturnListCopyWith<_$_DeliveryReturnList> get copyWith =>
      __$$_DeliveryReturnListCopyWithImpl<_$_DeliveryReturnList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryReturnListToJson(
      this,
    );
  }
}

abstract class _DeliveryReturnList implements DeliveryReturnList {
  const factory _DeliveryReturnList(
          final bool? status, final List<DeliveryReturn>? data) =
      _$_DeliveryReturnList;

  factory _DeliveryReturnList.fromJson(Map<String, dynamic> json) =
      _$_DeliveryReturnList.fromJson;

  @override
  bool? get status;
  @override
  List<DeliveryReturn>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryReturnListCopyWith<_$_DeliveryReturnList> get copyWith =>
      throw _privateConstructorUsedError;
}
