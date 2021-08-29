part of 'huduma_cubit.dart';

@freezed
abstract class HudumaState with _$HudumaState {
  const factory HudumaState.initial() = _Initial;
  const factory HudumaState.loading() = _Loading;
  const factory HudumaState.loaded(HudumaResponse response,String message) = _Loaded;
  const factory HudumaState.error(String message) = _Error;
}
