import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:memo/model/memo.dart';
import 'package:path/path.dart' as p ;
import 'package:path_provider/path_provider.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Memos,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createMemo(MemosCompanion data) => into(memos).insert(data);

  Future<Memo> getMemoById(int id) =>
      (select(memos)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<int> updateMemoById(int id, MemosCompanion data) =>
      (update(memos)..where((tbl) => tbl.id.equals(id))).write(data);

  Future<int> removeMemo(int id) =>
      (delete(memos)..where((tbl) => tbl.id.equals(id))).go();
  
  Stream<List<Memo>> watchMemos (){
    return select(memos).watch();
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
