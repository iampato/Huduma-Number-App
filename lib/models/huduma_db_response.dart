import 'package:moor/moor.dart';

class HudumDbResponse extends Table {
  TextColumn get idNumber => text()();
  TextColumn get status => text().nullable()();
  TextColumn get printingStatus => text().nullable()();
  TextColumn get collectionStatus => text().nullable()();
  TextColumn get deliveryPoint => text().nullable()();
  TextColumn get message => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {idNumber};
}
