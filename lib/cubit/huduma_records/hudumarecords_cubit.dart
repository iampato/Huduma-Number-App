import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huduma/cubit/huduma_repo_dao.dart';
import 'package:huduma/models/huduma_response.dart';

part 'hudumarecords_state.dart';
part 'hudumarecords_cubit.freezed.dart';

class HudumarecordsCubit extends Cubit<HudumarecordsState> {
  StreamSubscription? _subscription;
  final HudumaResponseDao hudumaResponseDao;
  HudumarecordsCubit(this.hudumaResponseDao)
      : super(HudumarecordsState.initial());

  Future<void> getRecords() async {
    try {
      _subscription?.cancel();
      _subscription = hudumaResponseDao.streamAllRecords().listen((event) {
        print(event);
        emit(HudumarecordsState.loaded(event, ""));
      });
    } catch (e) {
      emit(HudumarecordsState.error(e.toString()));
    }
  }

  Future<void> updateRecord(int id, HudumaResponse hudumaResponse) async {
    try {} catch (e) {
      emit(HudumarecordsState.error(e.toString()));
    }
  }

  Future<void> deleteRecord(int id) async {
    try {} catch (e) {
      emit(HudumarecordsState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
