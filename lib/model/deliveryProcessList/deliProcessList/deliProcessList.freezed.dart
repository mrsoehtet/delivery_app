// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliProcessList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryProcessList _$DeliveryProcessListFromJson(Map<String, dynamic> json) {
  return _DeliveryProcessList.fromJson(json);
}

/// @nodoc
mixin _$DeliveryProcessList {
  bool? get status => throw _privateConstructorUsedError;
  List<DeliveryProcess>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryProcessListCopyWith<DeliveryProcessList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryProcessListCopyWith<$Res> {
  factory $DeliveryProcessListCopyWith(
          DeliveryProcessList value, $Res Function(DeliveryProcessList) then) =
      _$DeliveryProcessListCopyWithImpl<$Res, DeliveryProcessList>;
  @useResult
  $Res call({bool? status, List<DeliveryProcess>? data});
}

/// @nodoc
class _$DeliveryProcessListCopyWithImpl<$Res, $Val extends DeliveryProcessList>
    implements $DeliveryProcessListCopyWith<$Res> {
  _$DeliveryProcessListCopyWithImpl(this._value, this._then);

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
              as List<DeliveryProcess>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryProcessListCopyWith<$Res>
    implements $DeliveryProcessListCopyWith<$Res> {
  factory _$$_DeliveryProcessListCopyWith(_$_DeliveryProcessList value,
          $Res Function(_$_DeliveryProcessList) then) =
      __$$_DeliveryProcessListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<DeliveryProcess>? data});
}

/// @nodoc
class __$$_DeliveryProcessListCopyWithImpl<$Res>
    extends _$DeliveryProcessListCopyWithImpl<$Res, _$_DeliveryProcessList>
    implements _$$_DeliveryProcessListCopyWith<$Res> {
  __$$_DeliveryProcessListCopyWithImpl(_$_DeliveryProcessList _value,
      $Res Function(_$_DeliveryProcessList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_DeliveryProcessList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DeliveryProcess>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryProcessList implements _DeliveryProcessList {
  const _$_DeliveryProcessList(this.status, final List<DeliveryProcess>? data)
      : _data = data;

  factory _$_DeliveryProcessList.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryProcessListFromJson(json);

  @override
  final bool? status;
  final List<DeliveryProcess>? _data;
  @override
  List<DeliveryProcess>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeliveryProcessList(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryProcessList &&
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
  _$$_DeliveryProcessListCopyWith<_$_DeliveryProcessList> get copyWith =>
      __$$_DeliveryProcessListCopyWithImpl<_$_DeliveryProcessList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryProcessListToJson(
      this,
    );
  }
}

abstract class _DeliveryProcessList implements DeliveryProcessList {
  const factory _DeliveryProcessList(
          final bool? status, final List<DeliveryProcess>? data) =
      _$_DeliveryProcessList;

  factory _DeliveryProcessList.fromJson(Map<String, dynamic> json) =
      _$_DeliveryProcessList.fromJson;

  @override
  bool? get status;
  @override
  List<DeliveryProcess>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryProcessListCopyWith<_$_DeliveryProcessList> get copyWith =>
      throw _privateConstructorUsedError;
}
