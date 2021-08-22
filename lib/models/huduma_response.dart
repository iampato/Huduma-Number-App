import 'package:freezed_annotation/freezed_annotation.dart';
part 'huduma_response.freezed.dart';
part 'huduma_response.g.dart';

@freezed
abstract class HudumaResponse with _$HudumaResponse {
    const factory HudumaResponse({
      @JsonKey(name: 'id_number') required String idNumber,
      @JsonKey(name: 'status') required String status,
      @JsonKey(name: 'printing_status') required dynamic printingStatus,
      @JsonKey(name: 'collection_status') required dynamic collectionStatus,
      @JsonKey(name: 'delivery_point') required dynamic deliveryPoint,
      @JsonKey(name: 'message') required String message,
    }) = _HudumaResponse;

    factory HudumaResponse.fromJson(Map<String, dynamic> json) => _$HudumaResponseFromJson(json);
}
