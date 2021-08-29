import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huduma/cubit/huduma_repo.dart';
import 'package:huduma/cubit/huduma_repo_dao.dart';
import 'package:huduma/models/huduma_response.dart';

part 'huduma_state.dart';
part 'huduma_cubit.freezed.dart';

class HudumaCubit extends Cubit<HudumaState> {
  final hudumaRepo = HudumaRepo();
  final HudumaResponseDao hudumaResponseDao;
  HudumaCubit(this.hudumaResponseDao) : super(HudumaState.initial());

  Future<void> checkHudumaNumberState({required String idNumber})async{
    emit(HudumaState.loading());
    try{
      final res = await hudumaRepo.getHttpHudumaStatus(idNumber: idNumber);
      hudumaResponseDao.addRecord(res);
      emit(HudumaState.loaded(res, ""));
    }catch(e){
      emit(HudumaState.error(e.toString()));
    }
  }
}
