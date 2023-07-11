import 'package:drift/drift.dart';

class Memos extends Table{
  IntColumn get id => integer().autoIncrement()();

  TextColumn get firstLine => text()();

  TextColumn get remainingLines => text()();

  DateTimeColumn get date => dateTime().clientDefault(() => DateTime.now())();
}