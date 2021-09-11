import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huduma/cubit/huduma/huduma_cubit.dart';
import 'package:huduma/cubit/huduma_repo.dart';
import 'package:huduma/cubit/huduma_repo_dao.dart';
import 'package:huduma/models/huduma_response.dart';

part 'hudumarecords_state.dart';
part 'hudumarecords_cubit.freezed.dart';

class HudumarecordsCubit extends Cubit<HudumarecordsState> {
  StreamSubscription? _subscription;
  final HudumaResponseDao hudumaResponseDao;
  final hudumaRepo = HudumaRepo();
  HudumarecordsCubit(this.hudumaResponseDao)
      : super(HudumarecordsState.initial());

  Future<void> getRecords() async {
    try {
      _subscription?.cancel();
      _subscription = hudumaResponseDao.streamAllRecords().listen((event) {
        emit(HudumarecordsState.loaded(event, ""));
      });
    } catch (e) {
      emit(HudumarecordsState.error(e.toString()));
    }
  }

  Future<void> updateRecord(String id, HudumaResponse hudumaResponse) async {
    try {} catch (e) {
      emit(HudumarecordsState.error(e.toString()));
    }
  }

  Future<void> checkHudumaNumberState({required String idNumber}) async {
    final currentState = state;
    if (currentState is _Loaded) {
      emit($HudumarecordsState.loaded(currentState.response, "Fetching your data"));
      try {
        final res = await hudumaRepo.getHttpHudumaStatus(idNumber: idNumber);
        hudumaResponseDao.addRecord(res);
        emit($HudumarecordsState.loaded(currentState.response, "Done"));
      } catch (e) {
        emit(HudumarecordsState.error(e.toString()));
      }
    }
  }

  Future<void> deleteRecord(String id) async {
    try {
      await hudumaResponseDao.deleteRecord(id);
    } catch (e) {
      emit(HudumarecordsState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
