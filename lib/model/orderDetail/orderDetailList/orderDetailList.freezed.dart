// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orderDetailList.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDetailList _$OrderDetailListFromJson(Map<String, dynamic> json) {
  return _OrderDetailList.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailList {
  bool? get status => throw _privateConstructorUsedError;
  OrderDetail? get order => throw _privateConstructorUsedError;
  ClientCode? get client_code => throw _privateConstructorUsedError;
  Delimen? get delimen => throw _privateConstructorUsedError;
  FromState? get from_state => throw _privateConstructorUsedError;
  ToState? get to_state => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailListCopyWith<OrderDetailList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailListCopyWith<$Res> {
  factory $OrderDetailListCopyWith(
          OrderDetailList value, $Res Function(OrderDetailList) then) =
      _$OrderDetailListCopyWithImpl<$Res, OrderDetailList>;
  @useResult
  $Res call(
      {bool? status,
      OrderDetail? order,
      ClientCode? client_code,
      Delimen? delimen,
      FromState? from_state,
      ToState? to_state,
      String? message});

  $OrderDetailCopyWith<$Res>? get order;
  $ClientCodeCopyWith<$Res>? get client_code;
  $DelimenCopyWith<$Res>? get delimen;
  $FromStateCopyWith<$Res>? get from_state;
  $ToStateCopyWith<$Res>? get to_state;
}

/// @nodoc
class _$OrderDetailListCopyWithImpl<$Res, $Val extends OrderDetailList>
    implements $OrderDetailListCopyWith<$Res> {
  _$OrderDetailListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? order = freezed,
    Object? client_code = freezed,
    Object? delimen = freezed,
    Object? from_state = freezed,
    Object? to_state = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDetail?,
      client_code: freezed == client_code
          ? _value.client_code
          : client_code // ignore: cast_nullable_to_non_nullable
              as ClientCode?,
      delimen: freezed == delimen
          ? _value.delimen
          : delimen // ignore: cast_nullable_to_non_nullable
              as Delimen?,
      from_state: freezed == from_state
          ? _value.from_state
          : from_state // ignore: cast_nullable_to_non_nullable
              as FromState?,
      to_state: freezed == to_state
          ? _value.to_state
          : to_state // ignore: cast_nullable_to_non_nullable
              as ToState?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDetailCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderDetailCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientCodeCopyWith<$Res>? get client_code {
    if (_value.client_code == null) {
      return null;
    }

    return $ClientCodeCopyWith<$Res>(_value.client_code!, (value) {
      return _then(_value.copyWith(client_code: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DelimenCopyWith<$Res>? get delimen {
    if (_value.delimen == null) {
      return null;
    }

    return $DelimenCopyWith<$Res>(_value.delimen!, (value) {
      return _then(_value.copyWith(delimen: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FromStateCopyWith<$Res>? get from_state {
    if (_value.from_state == null) {
      return null;
    }

    return $FromStateCopyWith<$Res>(_value.from_state!, (value) {
      return _then(_value.copyWith(from_state: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ToStateCopyWith<$Res>? get to_state {
    if (_value.to_state == null) {
      return null;
    }

    return $ToStateCopyWith<$Res>(_value.to_state!, (value) {
      return _then(_value.copyWith(to_state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderDetailListCopyWith<$Res>
    implements $OrderDetailListCopyWith<$Res> {
  factory _$$_OrderDetailListCopyWith(
          _$_OrderDetailList value, $Res Function(_$_OrderDetailList) then) =
      __$$_OrderDetailListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      OrderDetail? order,
      ClientCode? client_code,
      Delimen? delimen,
      FromState? from_state,
      ToState? to_state,
      String? message});

  @override
  $OrderDetailCopyWith<$Res>? get order;
  @override
  $ClientCodeCopyWith<$Res>? get client_code;
  @override
  $DelimenCopyWith<$Res>? get delimen;
  @override
  $FromStateCopyWith<$Res>? get from_state;
  @override
  $ToStateCopyWith<$Res>? get to_state;
}

/// @nodoc
class __$$_OrderDetailListCopyWithImpl<$Res>
    extends _$OrderDetailListCopyWithImpl<$Res, _$_OrderDetailList>
    implements _$$_OrderDetailListCopyWith<$Res> {
  __$$_OrderDetailListCopyWithImpl(
      _$_OrderDetailList _value, $Res Function(_$_OrderDetailList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? order = freezed,
    Object? client_code = freezed,
    Object? delimen = freezed,
    Object? from_state = freezed,
    Object? to_state = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_OrderDetailList(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDetail?,
      freezed == client_code
          ? _value.client_code
          : client_code // ignore: cast_nullable_to_non_nullable
              as ClientCode?,
      freezed == delimen
          ? _value.delimen
          : delimen // ignore: cast_nullable_to_non_nullable
              as Delimen?,
      freezed == from_state
          ? _value.from_state
          : from_state // ignore: cast_nullable_to_non_nullable
              as FromState?,
      freezed == to_state
          ? _value.to_state
          : to_state // ignore: cast_nullable_to_non_nullable
              as ToState?,
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetailList implements _OrderDetailList {
  const _$_OrderDetailList(this.status, this.order, this.client_code,
      this.delimen, this.from_state, this.to_state, this.message);

  factory _$_OrderDetailList.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailListFromJson(json);

  @override
  final bool? status;
  @override
  final OrderDetail? order;
  @override
  final ClientCode? client_code;
  @override
  final Delimen? delimen;
  @override
  final FromState? from_state;
  @override
  final ToState? to_state;
  @override
  final String? message;

  @override
  String toString() {
    return 'OrderDetailList(status: $status, order: $order, client_code: $client_code, delimen: $delimen, from_state: $from_state, to_state: $to_state, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetailList &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.client_code, client_code) ||
                other.client_code == client_code) &&
            (identical(other.delimen, delimen) || other.delimen == delimen) &&
            (identical(other.from_state, from_state) ||
                other.from_state == from_state) &&
            (identical(other.to_state, to_state) ||
                other.to_state == to_state) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, order, client_code,
      delimen, from_state, to_state, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDetailListCopyWith<_$_OrderDetailList> get copyWith =>
      __$$_OrderDetailListCopyWithImpl<_$_OrderDetailList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailListToJson(
      this,
    );
  }
}

abstract class _OrderDetailList implements OrderDetailList {
  const factory _OrderDetailList(
      final bool? status,
      final OrderDetail? order,
      final ClientCode? client_code,
      final Delimen? delimen,
      final FromState? from_state,
      final ToState? to_state,
      final String? message) = _$_OrderDetailList;

  factory _OrderDetailList.fromJson(Map<String, dynamic> json) =
      _$_OrderDetailList.fromJson;

  @override
  bool? get status;
  @override
  OrderDetail? get order;
  @override
  ClientCode? get client_code;
  @override
  Delimen? get delimen;
  @override
  FromState? get from_state;
  @override
  ToState? get to_state;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailListCopyWith<_$_OrderDetailList> get copyWith =>
      throw _privateConstructorUsedError;
}
