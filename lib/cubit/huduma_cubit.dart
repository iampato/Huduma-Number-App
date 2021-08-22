import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huduma/huduma_repo.dart';
import 'package:huduma/models/huduma_response.dart';

part 'huduma_state.dart';
part 'huduma_cubit.freezed.dart';

class HudumaCubit extends Cubit<HudumaState> {
  final hudumaRepo = HudumaRepo();
  HudumaCubit() : super(HudumaState.initial());

  Future<void> checkHudumaNumberState({required String idNumber})async{
    emit(HudumaState.loading());
    try{
      final res = await hudumaRepo.getHttpHudumaStatus(idNumber: idNumber);
      emit(HudumaState.loaded(res, ""));
    }catch(e){
      emit(HudumaState.error(e.toString()));
    }
  }
}
