import 'package:huduma/models/huduma_response.dart';
import 'package:moor/moor.dart';

import 'package:huduma/models/huduma_db_response.dart';
import 'package:huduma/utils/moor_utils.dart';

part 'huduma_repo_dao.g.dart';

@UseDao(tables: [HudumDbResponse])
class HudumaResponseDao extends DatabaseAccessor<MyDatabase>
    with _$HudumaResponseDaoMixin {
  // Declare the constructor needed by the generated mixin
  HudumaResponseDao(MyDatabase db) : super(db);

  Stream<List<HudumaResponse>> streamAllRecords() {
    final results = select(hudumDbResponse).watch();
    return results.map((list) {
      return list.map((res) {
        return HudumaResponse(
          idNumber: res.idNumber!,
          status: res.status!,
          printingStatus: res.printingStatus,
          collectionStatus: res.collectionStatus,
          deliveryPoint: res.deliveryPoint,
          message: res.message!,
        );
      }).toList();
    });
  }

  Future<int> addRecord(HudumaResponse hudumaResponse) {
    return into(hudumDbResponse).insert(HudumDbResponseCompanion(
      idNumber: Value(hudumaResponse.idNumber),
      status: Value(hudumaResponse.status),
      printingStatus: Value(hudumaResponse.printingStatus),
      collectionStatus: Value(hudumaResponse.collectionStatus),
      deliveryPoint: Value(hudumaResponse.deliveryPoint),
      message: Value(hudumaResponse.message),
      createdAt: Value(DateTime.now()),
    ));
  }

  Future updateRecord(int id, HudumaResponse hudumaResponse) {
    return (update(hudumDbResponse)..where((tbl) => tbl.id.equals(id)))
        .replace(HudumDbResponseCompanion(
      idNumber: Value(hudumaResponse.idNumber),
      status: Value(hudumaResponse.status),
      printingStatus: Value(hudumaResponse.printingStatus),
      collectionStatus: Value(hudumaResponse.collectionStatus),
      deliveryPoint: Value(hudumaResponse.deliveryPoint),
      message: Value(hudumaResponse.message),
      createdAt: Value(DateTime.now()),
    ));
  }

  Future<void> deleteRecord(int id) {
    return (delete(hudumDbResponse)..where((tbl) => tbl.id.equals(id))).go();
  }
}
