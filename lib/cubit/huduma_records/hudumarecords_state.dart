part of 'hudumarecords_cubit.dart';

@freezed
abstract class HudumarecordsState with _$HudumarecordsState {
  const factory HudumarecordsState.initial() = _Initial;
  const factory HudumarecordsState.loaded(List<HudumaResponse> response,String message) = _Loaded;
  const factory HudumarecordsState.error(String message) = _Error;
}
