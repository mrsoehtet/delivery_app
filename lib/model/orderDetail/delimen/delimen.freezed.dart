// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delimen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Delimen _$DelimenFromJson(Map<String, dynamic> json) {
  return _Delimen.fromJson(json);
}

/// @nodoc
mixin _$Delimen {
  String? get full_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DelimenCopyWith<Delimen> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DelimenCopyWith<$Res> {
  factory $DelimenCopyWith(Delimen value, $Res Function(Delimen) then) =
      _$DelimenCopyWithImpl<$Res, Delimen>;
  @useResult
  $Res call({String? full_name});
}

/// @nodoc
class _$DelimenCopyWithImpl<$Res, $Val extends Delimen>
    implements $DelimenCopyWith<$Res> {
  _$DelimenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? full_name = freezed,
  }) {
    return _then(_value.copyWith(
      full_name: freezed == full_name
          ? _value.full_name
          : full_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DelimenCopyWith<$Res> implements $DelimenCopyWith<$Res> {
  factory _$$_DelimenCopyWith(
          _$_Delimen value, $Res Function(_$_Delimen) then) =
      __$$_DelimenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? full_name});
}

/// @nodoc
class __$$_DelimenCopyWithImpl<$Res>
    extends _$DelimenCopyWithImpl<$Res, _$_Delimen>
    implements _$$_DelimenCopyWith<$Res> {
  __$$_DelimenCopyWithImpl(_$_Delimen _value, $Res Function(_$_Delimen) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? full_name = freezed,
  }) {
    return _then(_$_Delimen(
      freezed == full_name
          ? _value.full_name
          : full_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Delimen implements _Delimen {
  const _$_Delimen(this.full_name);

  factory _$_Delimen.fromJson(Map<String, dynamic> json) =>
      _$$_DelimenFromJson(json);

  @override
  final String? full_name;

  @override
  String toString() {
    return 'Delimen(full_name: $full_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delimen &&
            (identical(other.full_name, full_name) ||
                other.full_name == full_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, full_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DelimenCopyWith<_$_Delimen> get copyWith =>
      __$$_DelimenCopyWithImpl<_$_Delimen>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DelimenToJson(
      this,
    );
  }
}

abstract class _Delimen implements Delimen {
  const factory _Delimen(final String? full_name) = _$_Delimen;

  factory _Delimen.fromJson(Map<String, dynamic> json) = _$_Delimen.fromJson;

  @override
  String? get full_name;
  @override
  @JsonKey(ignore: true)
  _$$_DelimenCopyWith<_$_Delimen> get copyWith =>
      throw _privateConstructorUsedError;
}
