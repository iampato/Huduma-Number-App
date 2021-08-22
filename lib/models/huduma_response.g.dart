// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'huduma_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HudumaResponse _$_$_HudumaResponseFromJson(Map<String, dynamic> json) {
  return _$_HudumaResponse(
    idNumber: json['id_number'] as String,
    status: json['status'] as String,
    printingStatus: json['printing_status'],
    collectionStatus: json['collection_status'],
    deliveryPoint: json['delivery_point'],
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$_$_HudumaResponseToJson(_$_HudumaResponse instance) =>
    <String, dynamic>{
      'id_number': instance.idNumber,
      'status': instance.status,
      'printing_status': instance.printingStatus,
      'collection_status': instance.collectionStatus,
      'delivery_point': instance.deliveryPoint,
      'message': instance.message,
    };
