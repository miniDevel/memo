import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:memo/const/theme_colors.dart';
import 'package:memo/database/drift_database.dart';
import 'package:memo/screen/home_screen.dart';


void main() async {
  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'HancomMalang'),
    debugShowCheckedModeBanner: false,
    home: HomeScreen(
      theme: ThemeColors(),
    ),
  ));
}
