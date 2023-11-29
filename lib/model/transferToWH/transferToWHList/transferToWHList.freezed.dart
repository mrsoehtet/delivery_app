// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transferToWHList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferToWHList _$TransferToWHListFromJson(Map<String, dynamic> json) {
  return _TransferToWHList.fromJson(json);
}

/// @nodoc
mixin _$TransferToWHList {
  bool? get status => throw _privateConstructorUsedError;
  List<TransferToWH>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferToWHListCopyWith<TransferToWHList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferToWHListCopyWith<$Res> {
  factory $TransferToWHListCopyWith(
          TransferToWHList value, $Res Function(TransferToWHList) then) =
      _$TransferToWHListCopyWithImpl<$Res, TransferToWHList>;
  @useResult
  $Res call({bool? status, List<TransferToWH>? data});
}

/// @nodoc
class _$TransferToWHListCopyWithImpl<$Res, $Val extends TransferToWHList>
    implements $TransferToWHListCopyWith<$Res> {
  _$TransferToWHListCopyWithImpl(this._value, this._then);

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
              as List<TransferToWH>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransferToWHListCopyWith<$Res>
    implements $TransferToWHListCopyWith<$Res> {
  factory _$$_TransferToWHListCopyWith(
          _$_TransferToWHList value, $Res Function(_$_TransferToWHList) then) =
      __$$_TransferToWHListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<TransferToWH>? data});
}

/// @nodoc
class __$$_TransferToWHListCopyWithImpl<$Res>
    extends _$TransferToWHListCopyWithImpl<$Res, _$_TransferToWHList>
    implements _$$_TransferToWHListCopyWith<$Res> {
  __$$_TransferToWHListCopyWithImpl(
      _$_TransferToWHList _value, $Res Function(_$_TransferToWHList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_TransferToWHList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransferToWH>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferToWHList implements _TransferToWHList {
  const _$_TransferToWHList(this.status, final List<TransferToWH>? data)
      : _data = data;

  factory _$_TransferToWHList.fromJson(Map<String, dynamic> json) =>
      _$$_TransferToWHListFromJson(json);

  @override
  final bool? status;
  final List<TransferToWH>? _data;
  @override
  List<TransferToWH>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TransferToWHList(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransferToWHList &&
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
  _$$_TransferToWHListCopyWith<_$_TransferToWHList> get copyWith =>
      __$$_TransferToWHListCopyWithImpl<_$_TransferToWHList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransferToWHListToJson(
      this,
    );
  }
}

abstract class _TransferToWHList implements TransferToWHList {
  const factory _TransferToWHList(
      final bool? status, final List<TransferToWH>? data) = _$_TransferToWHList;

  factory _TransferToWHList.fromJson(Map<String, dynamic> json) =
      _$_TransferToWHList.fromJson;

  @override
  bool? get status;
  @override
  List<TransferToWH>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_TransferToWHListCopyWith<_$_TransferToWHList> get copyWith =>
      throw _privateConstructorUsedError;
}
