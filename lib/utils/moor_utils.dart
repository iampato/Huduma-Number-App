import 'dart:io';

import 'package:huduma/cubit/huduma_repo_dao.dart';
import 'package:huduma/models/huduma_db_response.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'moor_utils.g.dart';

// setup a Flutter moor QueryExecutor
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [HudumDbResponse], daos: [HudumaResponseDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.alterTable(TableMigration(hudumDbResponse));
        }
      });
}
