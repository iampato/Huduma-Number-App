// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_utils.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class HudumDbResponseData extends DataClass
    implements Insertable<HudumDbResponseData> {
  final int id;
  final String? idNumber;
  final String? status;
  final String? printingStatus;
  final String? collectionStatus;
  final String? deliveryPoint;
  final String? message;
  final DateTime createdAt;
  HudumDbResponseData(
      {required this.id,
      this.idNumber,
      this.status,
      this.printingStatus,
      this.collectionStatus,
      this.deliveryPoint,
      this.message,
      required this.createdAt});
  factory HudumDbResponseData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HudumDbResponseData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_number']),
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
      printingStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}printing_status']),
      collectionStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}collection_status']),
      deliveryPoint: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}delivery_point']),
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idNumber != null) {
      map['id_number'] = Variable<String?>(idNumber);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String?>(status);
    }
    if (!nullToAbsent || printingStatus != null) {
      map['printing_status'] = Variable<String?>(printingStatus);
    }
    if (!nullToAbsent || collectionStatus != null) {
      map['collection_status'] = Variable<String?>(collectionStatus);
    }
    if (!nullToAbsent || deliveryPoint != null) {
      map['delivery_point'] = Variable<String?>(deliveryPoint);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String?>(message);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HudumDbResponseCompanion toCompanion(bool nullToAbsent) {
    return HudumDbResponseCompanion(
      id: Value(id),
      idNumber: idNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(idNumber),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      printingStatus: printingStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(printingStatus),
      collectionStatus: collectionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionStatus),
      deliveryPoint: deliveryPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryPoint),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      createdAt: Value(createdAt),
    );
  }

  factory HudumDbResponseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return HudumDbResponseData(
      id: serializer.fromJson<int>(json['id']),
      idNumber: serializer.fromJson<String?>(json['idNumber']),
      status: serializer.fromJson<String?>(json['status']),
      printingStatus: serializer.fromJson<String?>(json['printingStatus']),
      collectionStatus: serializer.fromJson<String?>(json['collectionStatus']),
      deliveryPoint: serializer.fromJson<String?>(json['deliveryPoint']),
      message: serializer.fromJson<String?>(json['message']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idNumber': serializer.toJson<String?>(idNumber),
      'status': serializer.toJson<String?>(status),
      'printingStatus': serializer.toJson<String?>(printingStatus),
      'collectionStatus': serializer.toJson<String?>(collectionStatus),
      'deliveryPoint': serializer.toJson<String?>(deliveryPoint),
      'message': serializer.toJson<String?>(message),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HudumDbResponseData copyWith(
          {int? id,
          String? idNumber,
          String? status,
          String? printingStatus,
          String? collectionStatus,
          String? deliveryPoint,
          String? message,
          DateTime? createdAt}) =>
      HudumDbResponseData(
        id: id ?? this.id,
        idNumber: idNumber ?? this.idNumber,
        status: status ?? this.status,
        printingStatus: printingStatus ?? this.printingStatus,
        collectionStatus: collectionStatus ?? this.collectionStatus,
        deliveryPoint: deliveryPoint ?? this.deliveryPoint,
        message: message ?? this.message,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('HudumDbResponseData(')
          ..write('id: $id, ')
          ..write('idNumber: $idNumber, ')
          ..write('status: $status, ')
          ..write('printingStatus: $printingStatus, ')
          ..write('collectionStatus: $collectionStatus, ')
          ..write('deliveryPoint: $deliveryPoint, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idNumber.hashCode,
          $mrjc(
              status.hashCode,
              $mrjc(
                  printingStatus.hashCode,
                  $mrjc(
                      collectionStatus.hashCode,
                      $mrjc(deliveryPoint.hashCode,
                          $mrjc(message.hashCode, createdAt.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HudumDbResponseData &&
          other.id == this.id &&
          other.idNumber == this.idNumber &&
          other.status == this.status &&
          other.printingStatus == this.printingStatus &&
          other.collectionStatus == this.collectionStatus &&
          other.deliveryPoint == this.deliveryPoint &&
          other.message == this.message &&
          other.createdAt == this.createdAt);
}

class HudumDbResponseCompanion extends UpdateCompanion<HudumDbResponseData> {
  final Value<int> id;
  final Value<String?> idNumber;
  final Value<String?> status;
  final Value<String?> printingStatus;
  final Value<String?> collectionStatus;
  final Value<String?> deliveryPoint;
  final Value<String?> message;
  final Value<DateTime> createdAt;
  const HudumDbResponseCompanion({
    this.id = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.status = const Value.absent(),
    this.printingStatus = const Value.absent(),
    this.collectionStatus = const Value.absent(),
    this.deliveryPoint = const Value.absent(),
    this.message = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HudumDbResponseCompanion.insert({
    this.id = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.status = const Value.absent(),
    this.printingStatus = const Value.absent(),
    this.collectionStatus = const Value.absent(),
    this.deliveryPoint = const Value.absent(),
    this.message = const Value.absent(),
    required DateTime createdAt,
  }) : createdAt = Value(createdAt);
  static Insertable<HudumDbResponseData> custom({
    Expression<int>? id,
    Expression<String?>? idNumber,
    Expression<String?>? status,
    Expression<String?>? printingStatus,
    Expression<String?>? collectionStatus,
    Expression<String?>? deliveryPoint,
    Expression<String?>? message,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idNumber != null) 'id_number': idNumber,
      if (status != null) 'status': status,
      if (printingStatus != null) 'printing_status': printingStatus,
      if (collectionStatus != null) 'collection_status': collectionStatus,
      if (deliveryPoint != null) 'delivery_point': deliveryPoint,
      if (message != null) 'message': message,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HudumDbResponseCompanion copyWith(
      {Value<int>? id,
      Value<String?>? idNumber,
      Value<String?>? status,
      Value<String?>? printingStatus,
      Value<String?>? collectionStatus,
      Value<String?>? deliveryPoint,
      Value<String?>? message,
      Value<DateTime>? createdAt}) {
    return HudumDbResponseCompanion(
      id: id ?? this.id,
      idNumber: idNumber ?? this.idNumber,
      status: status ?? this.status,
      printingStatus: printingStatus ?? this.printingStatus,
      collectionStatus: collectionStatus ?? this.collectionStatus,
      deliveryPoint: deliveryPoint ?? this.deliveryPoint,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<String?>(idNumber.value);
    }
    if (status.present) {
      map['status'] = Variable<String?>(status.value);
    }
    if (printingStatus.present) {
      map['printing_status'] = Variable<String?>(printingStatus.value);
    }
    if (collectionStatus.present) {
      map['collection_status'] = Variable<String?>(collectionStatus.value);
    }
    if (deliveryPoint.present) {
      map['delivery_point'] = Variable<String?>(deliveryPoint.value);
    }
    if (message.present) {
      map['message'] = Variable<String?>(message.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HudumDbResponseCompanion(')
          ..write('id: $id, ')
          ..write('idNumber: $idNumber, ')
          ..write('status: $status, ')
          ..write('printingStatus: $printingStatus, ')
          ..write('collectionStatus: $collectionStatus, ')
          ..write('deliveryPoint: $deliveryPoint, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HudumDbResponseTable extends HudumDbResponse
    with TableInfo<$HudumDbResponseTable, HudumDbResponseData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $HudumDbResponseTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idNumberMeta = const VerificationMeta('idNumber');
  @override
  late final GeneratedTextColumn idNumber = _constructIdNumber();
  GeneratedTextColumn _constructIdNumber() {
    return GeneratedTextColumn(
      'id_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedTextColumn status = _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _printingStatusMeta =
      const VerificationMeta('printingStatus');
  @override
  late final GeneratedTextColumn printingStatus = _constructPrintingStatus();
  GeneratedTextColumn _constructPrintingStatus() {
    return GeneratedTextColumn(
      'printing_status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _collectionStatusMeta =
      const VerificationMeta('collectionStatus');
  @override
  late final GeneratedTextColumn collectionStatus =
      _constructCollectionStatus();
  GeneratedTextColumn _constructCollectionStatus() {
    return GeneratedTextColumn(
      'collection_status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deliveryPointMeta =
      const VerificationMeta('deliveryPoint');
  @override
  late final GeneratedTextColumn deliveryPoint = _constructDeliveryPoint();
  GeneratedTextColumn _constructDeliveryPoint() {
    return GeneratedTextColumn(
      'delivery_point',
      $tableName,
      true,
    );
  }

  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedTextColumn message = _constructMessage();
  GeneratedTextColumn _constructMessage() {
    return GeneratedTextColumn(
      'message',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idNumber,
        status,
        printingStatus,
        collectionStatus,
        deliveryPoint,
        message,
        createdAt
      ];
  @override
  $HudumDbResponseTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'hudum_db_response';
  @override
  final String actualTableName = 'hudum_db_response';
  @override
  VerificationContext validateIntegrity(
      Insertable<HudumDbResponseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_number')) {
      context.handle(_idNumberMeta,
          idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('printing_status')) {
      context.handle(
          _printingStatusMeta,
          printingStatus.isAcceptableOrUnknown(
              data['printing_status']!, _printingStatusMeta));
    }
    if (data.containsKey('collection_status')) {
      context.handle(
          _collectionStatusMeta,
          collectionStatus.isAcceptableOrUnknown(
              data['collection_status']!, _collectionStatusMeta));
    }
    if (data.containsKey('delivery_point')) {
      context.handle(
          _deliveryPointMeta,
          deliveryPoint.isAcceptableOrUnknown(
              data['delivery_point']!, _deliveryPointMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HudumDbResponseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return HudumDbResponseData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HudumDbResponseTable createAlias(String alias) {
    return $HudumDbResponseTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $HudumDbResponseTable hudumDbResponse =
      $HudumDbResponseTable(this);
  late final HudumaResponseDao hudumaResponseDao =
      HudumaResponseDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [hudumDbResponse];
}
