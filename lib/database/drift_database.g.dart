// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $MemoTable extends Memo with TableInfo<$MemoTable, MemoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstLineMeta =
      const VerificationMeta('firstLine');
  @override
  late final GeneratedColumn<String> firstLine = GeneratedColumn<String>(
      'first_line', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remainingLinesMeta =
      const VerificationMeta('remainingLines');
  @override
  late final GeneratedColumn<String> remainingLines = GeneratedColumn<String>(
      'remaining_lines', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [id, firstLine, remainingLines, date];
  @override
  String get aliasedName => _alias ?? 'memo';
  @override
  String get actualTableName => 'memo';
  @override
  VerificationContext validateIntegrity(Insertable<MemoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_line')) {
      context.handle(_firstLineMeta,
          firstLine.isAcceptableOrUnknown(data['first_line']!, _firstLineMeta));
    } else if (isInserting) {
      context.missing(_firstLineMeta);
    }
    if (data.containsKey('remaining_lines')) {
      context.handle(
          _remainingLinesMeta,
          remainingLines.isAcceptableOrUnknown(
              data['remaining_lines']!, _remainingLinesMeta));
    } else if (isInserting) {
      context.missing(_remainingLinesMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstLine: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_line'])!,
      remainingLines: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}remaining_lines'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $MemoTable createAlias(String alias) {
    return $MemoTable(attachedDatabase, alias);
  }
}

class MemoData extends DataClass implements Insertable<MemoData> {
  final int id;
  final String firstLine;
  final String remainingLines;
  final DateTime date;
  const MemoData(
      {required this.id,
      required this.firstLine,
      required this.remainingLines,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_line'] = Variable<String>(firstLine);
    map['remaining_lines'] = Variable<String>(remainingLines);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  MemoCompanion toCompanion(bool nullToAbsent) {
    return MemoCompanion(
      id: Value(id),
      firstLine: Value(firstLine),
      remainingLines: Value(remainingLines),
      date: Value(date),
    );
  }

  factory MemoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemoData(
      id: serializer.fromJson<int>(json['id']),
      firstLine: serializer.fromJson<String>(json['firstLine']),
      remainingLines: serializer.fromJson<String>(json['remainingLines']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstLine': serializer.toJson<String>(firstLine),
      'remainingLines': serializer.toJson<String>(remainingLines),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  MemoData copyWith(
          {int? id,
          String? firstLine,
          String? remainingLines,
          DateTime? date}) =>
      MemoData(
        id: id ?? this.id,
        firstLine: firstLine ?? this.firstLine,
        remainingLines: remainingLines ?? this.remainingLines,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('MemoData(')
          ..write('id: $id, ')
          ..write('firstLine: $firstLine, ')
          ..write('remainingLines: $remainingLines, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstLine, remainingLines, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemoData &&
          other.id == this.id &&
          other.firstLine == this.firstLine &&
          other.remainingLines == this.remainingLines &&
          other.date == this.date);
}

class MemoCompanion extends UpdateCompanion<MemoData> {
  final Value<int> id;
  final Value<String> firstLine;
  final Value<String> remainingLines;
  final Value<DateTime> date;
  const MemoCompanion({
    this.id = const Value.absent(),
    this.firstLine = const Value.absent(),
    this.remainingLines = const Value.absent(),
    this.date = const Value.absent(),
  });
  MemoCompanion.insert({
    this.id = const Value.absent(),
    required String firstLine,
    required String remainingLines,
    this.date = const Value.absent(),
  })  : firstLine = Value(firstLine),
        remainingLines = Value(remainingLines);
  static Insertable<MemoData> custom({
    Expression<int>? id,
    Expression<String>? firstLine,
    Expression<String>? remainingLines,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstLine != null) 'first_line': firstLine,
      if (remainingLines != null) 'remaining_lines': remainingLines,
      if (date != null) 'date': date,
    });
  }

  MemoCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstLine,
      Value<String>? remainingLines,
      Value<DateTime>? date}) {
    return MemoCompanion(
      id: id ?? this.id,
      firstLine: firstLine ?? this.firstLine,
      remainingLines: remainingLines ?? this.remainingLines,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstLine.present) {
      map['first_line'] = Variable<String>(firstLine.value);
    }
    if (remainingLines.present) {
      map['remaining_lines'] = Variable<String>(remainingLines.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemoCompanion(')
          ..write('id: $id, ')
          ..write('firstLine: $firstLine, ')
          ..write('remainingLines: $remainingLines, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $MemoTable memo = $MemoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [memo];
}
