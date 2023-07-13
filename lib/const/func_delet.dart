import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:memo/database/drift_database.dart';

Future<bool> customDialog (context,int id)async{
  final result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('삭 제'),
        content: Text('메모를 삭제 합니다.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('아니오'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('삭 제'),
          ),
        ],
      );
    },
  );
  if (result == true) {
    GetIt.I<LocalDatabase>().removeMemo(id);
    return true;
  }

  throw 'error' ;
}
