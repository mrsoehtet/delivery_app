// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessList _$ProcessListFromJson(Map<String, dynamic> json) {
  return _ProcessList.fromJson(json);
}

/// @nodoc
mixin _$ProcessList {
  bool? get status => throw _privateConstructorUsedError;
  List<Process>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessListCopyWith<ProcessList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessListCopyWith<$Res> {
  factory $ProcessListCopyWith(
          ProcessList value, $Res Function(ProcessList) then) =
      _$ProcessListCopyWithImpl<$Res, ProcessList>;
  @useResult
  $Res call({bool? status, List<Process>? data});
}

/// @nodoc
class _$ProcessListCopyWithImpl<$Res, $Val extends ProcessList>
    implements $ProcessListCopyWith<$Res> {
  _$ProcessListCopyWithImpl(this._value, this._then);

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
              as List<Process>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProcessListCopyWith<$Res>
    implements $ProcessListCopyWith<$Res> {
  factory _$$_ProcessListCopyWith(
          _$_ProcessList value, $Res Function(_$_ProcessList) then) =
      __$$_ProcessListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, List<Process>? data});
}

/// @nodoc
class __$$_ProcessListCopyWithImpl<$Res>
    extends _$ProcessListCopyWithImpl<$Res, _$_ProcessList>
    implements _$$_ProcessListCopyWith<$Res> {
  __$$_ProcessListCopyWithImpl(
      _$_ProcessList _value, $Res Function(_$_ProcessList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ProcessList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Process>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProcessList implements _ProcessList {
  const _$_ProcessList(this.status, final List<Process>? data) : _data = data;

  factory _$_ProcessList.fromJson(Map<String, dynamic> json) =>
      _$$_ProcessListFromJson(json);

  @override
  final bool? status;
  final List<Process>? _data;
  @override
  List<Process>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProcessList(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProcessList &&
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
  _$$_ProcessListCopyWith<_$_ProcessList> get copyWith =>
      __$$_ProcessListCopyWithImpl<_$_ProcessList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProcessListToJson(
      this,
    );
  }
}

abstract class _ProcessList implements ProcessList {
  const factory _ProcessList(final bool? status, final List<Process>? data) =
      _$_ProcessList;

  factory _ProcessList.fromJson(Map<String, dynamic> json) =
      _$_ProcessList.fromJson;

  @override
  bool? get status;
  @override
  List<Process>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ProcessListCopyWith<_$_ProcessList> get copyWith =>
      throw _privateConstructorUsedError;
}
