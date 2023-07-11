import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import '../model/memo.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Memo,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createMemo(MemoCompanion data) => into(memo).insert(data);

  Future<MemoData> getMemoById(int id) =>
      (select(memo)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<int> updateMemoById(int id, MemoCompanion data) =>
      (update(memo)..where((tbl) => tbl.id.equals(id))).write(data);

  Future<int> removeMemo(int id) =>
      (delete(memo)..where((tbl) => tbl.id.equals(id))).go();
  
  Stream<List<MemoData>> watchMemos (){
    return select(memo).watch();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}
