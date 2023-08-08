// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $MemosTable extends Memos with TableInfo<$MemosTable, Memo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemosTable(this.attachedDatabase, [this._alias]);
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
  String get aliasedName => _alias ?? 'memos';
  @override
  String get actualTableName => 'memos';
  @override
  VerificationContext validateIntegrity(Insertable<Memo> instance,
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
  Memo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Memo(
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
  $MemosTable createAlias(String alias) {
    return $MemosTable(attachedDatabase, alias);
  }
}

class Memo extends DataClass implements Insertable<Memo> {
  final int id;
  final String firstLine;
  final String remainingLines;
  final DateTime date;
  const Memo(
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

  MemosCompanion toCompanion(bool nullToAbsent) {
    return MemosCompanion(
      id: Value(id),
      firstLine: Value(firstLine),
      remainingLines: Value(remainingLines),
      date: Value(date),
    );
  }

  factory Memo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Memo(
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

  Memo copyWith(
          {int? id,
          String? firstLine,
          String? remainingLines,
          DateTime? date}) =>
      Memo(
        id: id ?? this.id,
        firstLine: firstLine ?? this.firstLine,
        remainingLines: remainingLines ?? this.remainingLines,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Memo(')
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
      (other is Memo &&
          other.id == this.id &&
          other.firstLine == this.firstLine &&
          other.remainingLines == this.remainingLines &&
          other.date == this.date);
}

class MemosCompanion extends UpdateCompanion<Memo> {
  final Value<int> id;
  final Value<String> firstLine;
  final Value<String> remainingLines;
  final Value<DateTime> date;
  const MemosCompanion({
    this.id = const Value.absent(),
    this.firstLine = const Value.absent(),
    this.remainingLines = const Value.absent(),
    this.date = const Value.absent(),
  });
  MemosCompanion.insert({
    this.id = const Value.absent(),
    required String firstLine,
    required String remainingLines,
    this.date = const Value.absent(),
  })  : firstLine = Value(firstLine),
        remainingLines = Value(remainingLines);
  static Insertable<Memo> custom({
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

  MemosCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstLine,
      Value<String>? remainingLines,
      Value<DateTime>? date}) {
    return MemosCompanion(
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
    return (StringBuffer('MemosCompanion(')
          ..write('id: $id, ')
          ..write('firstLine: $firstLine, ')
          ..write('remainingLines: $remainingLines, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $ColorThemesTable extends ColorThemes
    with TableInfo<$ColorThemesTable, ColorTheme> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ColorThemesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _backgroundColorMeta =
      const VerificationMeta('backgroundColor');
  @override
  late final GeneratedColumn<String> backgroundColor = GeneratedColumn<String>(
      'background_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryColorMeta =
      const VerificationMeta('primaryColor');
  @override
  late final GeneratedColumn<String> primaryColor = GeneratedColumn<String>(
      'primary_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _whiteColorMeta =
      const VerificationMeta('whiteColor');
  @override
  late final GeneratedColumn<String> whiteColor = GeneratedColumn<String>(
      'white_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lightGreyColorMeta =
      const VerificationMeta('lightGreyColor');
  @override
  late final GeneratedColumn<String> lightGreyColor = GeneratedColumn<String>(
      'light_grey_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _darkGreyColorMeta =
      const VerificationMeta('darkGreyColor');
  @override
  late final GeneratedColumn<String> darkGreyColor = GeneratedColumn<String>(
      'dark_grey_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _blackColorMeta =
      const VerificationMeta('blackColor');
  @override
  late final GeneratedColumn<String> blackColor = GeneratedColumn<String>(
      'black_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        backgroundColor,
        primaryColor,
        whiteColor,
        lightGreyColor,
        darkGreyColor,
        blackColor
      ];
  @override
  String get aliasedName => _alias ?? 'color_themes';
  @override
  String get actualTableName => 'color_themes';
  @override
  VerificationContext validateIntegrity(Insertable<ColorTheme> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('background_color')) {
      context.handle(
          _backgroundColorMeta,
          backgroundColor.isAcceptableOrUnknown(
              data['background_color']!, _backgroundColorMeta));
    } else if (isInserting) {
      context.missing(_backgroundColorMeta);
    }
    if (data.containsKey('primary_color')) {
      context.handle(
          _primaryColorMeta,
          primaryColor.isAcceptableOrUnknown(
              data['primary_color']!, _primaryColorMeta));
    } else if (isInserting) {
      context.missing(_primaryColorMeta);
    }
    if (data.containsKey('white_color')) {
      context.handle(
          _whiteColorMeta,
          whiteColor.isAcceptableOrUnknown(
              data['white_color']!, _whiteColorMeta));
    } else if (isInserting) {
      context.missing(_whiteColorMeta);
    }
    if (data.containsKey('light_grey_color')) {
      context.handle(
          _lightGreyColorMeta,
          lightGreyColor.isAcceptableOrUnknown(
              data['light_grey_color']!, _lightGreyColorMeta));
    } else if (isInserting) {
      context.missing(_lightGreyColorMeta);
    }
    if (data.containsKey('dark_grey_color')) {
      context.handle(
          _darkGreyColorMeta,
          darkGreyColor.isAcceptableOrUnknown(
              data['dark_grey_color']!, _darkGreyColorMeta));
    } else if (isInserting) {
      context.missing(_darkGreyColorMeta);
    }
    if (data.containsKey('black_color')) {
      context.handle(
          _blackColorMeta,
          blackColor.isAcceptableOrUnknown(
              data['black_color']!, _blackColorMeta));
    } else if (isInserting) {
      context.missing(_blackColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ColorTheme map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ColorTheme(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      backgroundColor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}background_color'])!,
      primaryColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}primary_color'])!,
      whiteColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}white_color'])!,
      lightGreyColor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}light_grey_color'])!,
      darkGreyColor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}dark_grey_color'])!,
      blackColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}black_color'])!,
    );
  }

  @override
  $ColorThemesTable createAlias(String alias) {
    return $ColorThemesTable(attachedDatabase, alias);
  }
}

class ColorTheme extends DataClass implements Insertable<ColorTheme> {
  final int id;
  final String backgroundColor;
  final String primaryColor;
  final String whiteColor;
  final String lightGreyColor;
  final String darkGreyColor;
  final String blackColor;
  const ColorTheme(
      {required this.id,
      required this.backgroundColor,
      required this.primaryColor,
      required this.whiteColor,
      required this.lightGreyColor,
      required this.darkGreyColor,
      required this.blackColor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['background_color'] = Variable<String>(backgroundColor);
    map['primary_color'] = Variable<String>(primaryColor);
    map['white_color'] = Variable<String>(whiteColor);
    map['light_grey_color'] = Variable<String>(lightGreyColor);
    map['dark_grey_color'] = Variable<String>(darkGreyColor);
    map['black_color'] = Variable<String>(blackColor);
    return map;
  }

  ColorThemesCompanion toCompanion(bool nullToAbsent) {
    return ColorThemesCompanion(
      id: Value(id),
      backgroundColor: Value(backgroundColor),
      primaryColor: Value(primaryColor),
      whiteColor: Value(whiteColor),
      lightGreyColor: Value(lightGreyColor),
      darkGreyColor: Value(darkGreyColor),
      blackColor: Value(blackColor),
    );
  }

  factory ColorTheme.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ColorTheme(
      id: serializer.fromJson<int>(json['id']),
      backgroundColor: serializer.fromJson<String>(json['backgroundColor']),
      primaryColor: serializer.fromJson<String>(json['primaryColor']),
      whiteColor: serializer.fromJson<String>(json['whiteColor']),
      lightGreyColor: serializer.fromJson<String>(json['lightGreyColor']),
      darkGreyColor: serializer.fromJson<String>(json['darkGreyColor']),
      blackColor: serializer.fromJson<String>(json['blackColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'backgroundColor': serializer.toJson<String>(backgroundColor),
      'primaryColor': serializer.toJson<String>(primaryColor),
      'whiteColor': serializer.toJson<String>(whiteColor),
      'lightGreyColor': serializer.toJson<String>(lightGreyColor),
      'darkGreyColor': serializer.toJson<String>(darkGreyColor),
      'blackColor': serializer.toJson<String>(blackColor),
    };
  }

  ColorTheme copyWith(
          {int? id,
          String? backgroundColor,
          String? primaryColor,
          String? whiteColor,
          String? lightGreyColor,
          String? darkGreyColor,
          String? blackColor}) =>
      ColorTheme(
        id: id ?? this.id,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        primaryColor: primaryColor ?? this.primaryColor,
        whiteColor: whiteColor ?? this.whiteColor,
        lightGreyColor: lightGreyColor ?? this.lightGreyColor,
        darkGreyColor: darkGreyColor ?? this.darkGreyColor,
        blackColor: blackColor ?? this.blackColor,
      );
  @override
  String toString() {
    return (StringBuffer('ColorTheme(')
          ..write('id: $id, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('primaryColor: $primaryColor, ')
          ..write('whiteColor: $whiteColor, ')
          ..write('lightGreyColor: $lightGreyColor, ')
          ..write('darkGreyColor: $darkGreyColor, ')
          ..write('blackColor: $blackColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, backgroundColor, primaryColor, whiteColor,
      lightGreyColor, darkGreyColor, blackColor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ColorTheme &&
          other.id == this.id &&
          other.backgroundColor == this.backgroundColor &&
          other.primaryColor == this.primaryColor &&
          other.whiteColor == this.whiteColor &&
          other.lightGreyColor == this.lightGreyColor &&
          other.darkGreyColor == this.darkGreyColor &&
          other.blackColor == this.blackColor);
}

class ColorThemesCompanion extends UpdateCompanion<ColorTheme> {
  final Value<int> id;
  final Value<String> backgroundColor;
  final Value<String> primaryColor;
  final Value<String> whiteColor;
  final Value<String> lightGreyColor;
  final Value<String> darkGreyColor;
  final Value<String> blackColor;
  const ColorThemesCompanion({
    this.id = const Value.absent(),
    this.backgroundColor = const Value.absent(),
    this.primaryColor = const Value.absent(),
    this.whiteColor = const Value.absent(),
    this.lightGreyColor = const Value.absent(),
    this.darkGreyColor = const Value.absent(),
    this.blackColor = const Value.absent(),
  });
  ColorThemesCompanion.insert({
    this.id = const Value.absent(),
    required String backgroundColor,
    required String primaryColor,
    required String whiteColor,
    required String lightGreyColor,
    required String darkGreyColor,
    required String blackColor,
  })  : backgroundColor = Value(backgroundColor),
        primaryColor = Value(primaryColor),
        whiteColor = Value(whiteColor),
        lightGreyColor = Value(lightGreyColor),
        darkGreyColor = Value(darkGreyColor),
        blackColor = Value(blackColor);
  static Insertable<ColorTheme> custom({
    Expression<int>? id,
    Expression<String>? backgroundColor,
    Expression<String>? primaryColor,
    Expression<String>? whiteColor,
    Expression<String>? lightGreyColor,
    Expression<String>? darkGreyColor,
    Expression<String>? blackColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (backgroundColor != null) 'background_color': backgroundColor,
      if (primaryColor != null) 'primary_color': primaryColor,
      if (whiteColor != null) 'white_color': whiteColor,
      if (lightGreyColor != null) 'light_grey_color': lightGreyColor,
      if (darkGreyColor != null) 'dark_grey_color': darkGreyColor,
      if (blackColor != null) 'black_color': blackColor,
    });
  }

  ColorThemesCompanion copyWith(
      {Value<int>? id,
      Value<String>? backgroundColor,
      Value<String>? primaryColor,
      Value<String>? whiteColor,
      Value<String>? lightGreyColor,
      Value<String>? darkGreyColor,
      Value<String>? blackColor}) {
    return ColorThemesCompanion(
      id: id ?? this.id,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      primaryColor: primaryColor ?? this.primaryColor,
      whiteColor: whiteColor ?? this.whiteColor,
      lightGreyColor: lightGreyColor ?? this.lightGreyColor,
      darkGreyColor: darkGreyColor ?? this.darkGreyColor,
      blackColor: blackColor ?? this.blackColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (backgroundColor.present) {
      map['background_color'] = Variable<String>(backgroundColor.value);
    }
    if (primaryColor.present) {
      map['primary_color'] = Variable<String>(primaryColor.value);
    }
    if (whiteColor.present) {
      map['white_color'] = Variable<String>(whiteColor.value);
    }
    if (lightGreyColor.present) {
      map['light_grey_color'] = Variable<String>(lightGreyColor.value);
    }
    if (darkGreyColor.present) {
      map['dark_grey_color'] = Variable<String>(darkGreyColor.value);
    }
    if (blackColor.present) {
      map['black_color'] = Variable<String>(blackColor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ColorThemesCompanion(')
          ..write('id: $id, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('primaryColor: $primaryColor, ')
          ..write('whiteColor: $whiteColor, ')
          ..write('lightGreyColor: $lightGreyColor, ')
          ..write('darkGreyColor: $darkGreyColor, ')
          ..write('blackColor: $blackColor')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $MemosTable memos = $MemosTable(this);
  late final $ColorThemesTable colorThemes = $ColorThemesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [memos, colorThemes];
}
