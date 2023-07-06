import 'package:flutter/material.dart';
import 'package:memo/screen/home_screen.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'HancomMalang'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    )
  );
}

