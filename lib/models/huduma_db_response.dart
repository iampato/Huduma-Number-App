import 'package:moor/moor.dart';

class HudumDbResponse extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idNumber => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get printingStatus => text().nullable()();
  TextColumn get collectionStatus => text().nullable()();
  TextColumn get deliveryPoint => text().nullable()();
  TextColumn get message => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}