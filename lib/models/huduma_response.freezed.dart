// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'huduma_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HudumaResponse _$HudumaResponseFromJson(Map<String, dynamic> json) {
  return _HudumaResponse.fromJson(json);
}

/// @nodoc
class _$HudumaResponseTearOff {
  const _$HudumaResponseTearOff();

  _HudumaResponse call(
      {@JsonKey(name: 'id_number') required String idNumber,
      @JsonKey(name: 'status') required String status,
      @JsonKey(name: 'printing_status') required dynamic printingStatus,
      @JsonKey(name: 'collection_status') required dynamic collectionStatus,
      @JsonKey(name: 'delivery_point') required dynamic deliveryPoint,
      @JsonKey(name: 'message') required String message}) {
    return _HudumaResponse(
      idNumber: idNumber,
      status: status,
      printingStatus: printingStatus,
      collectionStatus: collectionStatus,
      deliveryPoint: deliveryPoint,
      message: message,
    );
  }

  HudumaResponse fromJson(Map<String, Object> json) {
    return HudumaResponse.fromJson(json);
  }
}

/// @nodoc
const $HudumaResponse = _$HudumaResponseTearOff();

/// @nodoc
mixin _$HudumaResponse {
  @JsonKey(name: 'id_number')
  String get idNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'printing_status')
  dynamic get printingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection_status')
  dynamic get collectionStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_point')
  dynamic get deliveryPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HudumaResponseCopyWith<HudumaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HudumaResponseCopyWith<$Res> {
  factory $HudumaResponseCopyWith(
          HudumaResponse value, $Res Function(HudumaResponse) then) =
      _$HudumaResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id_number') String idNumber,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'printing_status') dynamic printingStatus,
      @JsonKey(name: 'collection_status') dynamic collectionStatus,
      @JsonKey(name: 'delivery_point') dynamic deliveryPoint,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class _$HudumaResponseCopyWithImpl<$Res>
    implements $HudumaResponseCopyWith<$Res> {
  _$HudumaResponseCopyWithImpl(this._value, this._then);

  final HudumaResponse _value;
  // ignore: unused_field
  final $Res Function(HudumaResponse) _then;

  @override
  $Res call({
    Object? idNumber = freezed,
    Object? status = freezed,
    Object? printingStatus = freezed,
    Object? collectionStatus = freezed,
    Object? deliveryPoint = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      idNumber: idNumber == freezed
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      printingStatus: printingStatus == freezed
          ? _value.printingStatus
          : printingStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      collectionStatus: collectionStatus == freezed
          ? _value.collectionStatus
          : collectionStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPoint: deliveryPoint == freezed
          ? _value.deliveryPoint
          : deliveryPoint // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$HudumaResponseCopyWith<$Res>
    implements $HudumaResponseCopyWith<$Res> {
  factory _$HudumaResponseCopyWith(
          _HudumaResponse value, $Res Function(_HudumaResponse) then) =
      __$HudumaResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id_number') String idNumber,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'printing_status') dynamic printingStatus,
      @JsonKey(name: 'collection_status') dynamic collectionStatus,
      @JsonKey(name: 'delivery_point') dynamic deliveryPoint,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class __$HudumaResponseCopyWithImpl<$Res>
    extends _$HudumaResponseCopyWithImpl<$Res>
    implements _$HudumaResponseCopyWith<$Res> {
  __$HudumaResponseCopyWithImpl(
      _HudumaResponse _value, $Res Function(_HudumaResponse) _then)
      : super(_value, (v) => _then(v as _HudumaResponse));

  @override
  _HudumaResponse get _value => super._value as _HudumaResponse;

  @override
  $Res call({
    Object? idNumber = freezed,
    Object? status = freezed,
    Object? printingStatus = freezed,
    Object? collectionStatus = freezed,
    Object? deliveryPoint = freezed,
    Object? message = freezed,
  }) {
    return _then(_HudumaResponse(
      idNumber: idNumber == freezed
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      printingStatus: printingStatus == freezed
          ? _value.printingStatus
          : printingStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      collectionStatus: collectionStatus == freezed
          ? _value.collectionStatus
          : collectionStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryPoint: deliveryPoint == freezed
          ? _value.deliveryPoint
          : deliveryPoint // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HudumaResponse implements _HudumaResponse {
  const _$_HudumaResponse(
      {@JsonKey(name: 'id_number') required this.idNumber,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'printing_status') required this.printingStatus,
      @JsonKey(name: 'collection_status') required this.collectionStatus,
      @JsonKey(name: 'delivery_point') required this.deliveryPoint,
      @JsonKey(name: 'message') required this.message});

  factory _$_HudumaResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_HudumaResponseFromJson(json);

  @override
  @JsonKey(name: 'id_number')
  final String idNumber;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'printing_status')
  final dynamic printingStatus;
  @override
  @JsonKey(name: 'collection_status')
  final dynamic collectionStatus;
  @override
  @JsonKey(name: 'delivery_point')
  final dynamic deliveryPoint;
  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'HudumaResponse(idNumber: $idNumber, status: $status, printingStatus: $printingStatus, collectionStatus: $collectionStatus, deliveryPoint: $deliveryPoint, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HudumaResponse &&
            (identical(other.idNumber, idNumber) ||
                const DeepCollectionEquality()
                    .equals(other.idNumber, idNumber)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.printingStatus, printingStatus) ||
                const DeepCollectionEquality()
                    .equals(other.printingStatus, printingStatus)) &&
            (identical(other.collectionStatus, collectionStatus) ||
                const DeepCollectionEquality()
                    .equals(other.collectionStatus, collectionStatus)) &&
            (identical(other.deliveryPoint, deliveryPoint) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryPoint, deliveryPoint)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idNumber) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(printingStatus) ^
      const DeepCollectionEquality().hash(collectionStatus) ^
      const DeepCollectionEquality().hash(deliveryPoint) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$HudumaResponseCopyWith<_HudumaResponse> get copyWith =>
      __$HudumaResponseCopyWithImpl<_HudumaResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HudumaResponseToJson(this);
  }
}

abstract class _HudumaResponse implements HudumaResponse {
  const factory _HudumaResponse(
      {@JsonKey(name: 'id_number') required String idNumber,
      @JsonKey(name: 'status') required String status,
      @JsonKey(name: 'printing_status') required dynamic printingStatus,
      @JsonKey(name: 'collection_status') required dynamic collectionStatus,
      @JsonKey(name: 'delivery_point') required dynamic deliveryPoint,
      @JsonKey(name: 'message') required String message}) = _$_HudumaResponse;

  factory _HudumaResponse.fromJson(Map<String, dynamic> json) =
      _$_HudumaResponse.fromJson;

  @override
  @JsonKey(name: 'id_number')
  String get idNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'printing_status')
  dynamic get printingStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'collection_status')
  dynamic get collectionStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'delivery_point')
  dynamic get deliveryPoint => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HudumaResponseCopyWith<_HudumaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
