import 'package:drift/drift.dart';

class ColorThemes extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get backgroundColor => text()();
  TextColumn get primaryColor => text()();
  TextColumn get whiteColor => text()();
  TextColumn get lightGreyColor => text()();
  TextColumn get darkGreyColor => text()();
  TextColumn get blackColor => text()();
}