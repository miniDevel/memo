import 'package:flutter/material.dart';
import 'package:memo/const/colors.dart';
import 'package:memo/const/custom_button.dart';

AppBar memoScreenAppbar(DateTime dateTime,VoidCallback onPressed,String label) {
  return AppBar(
    centerTitle: true,
    title: Text(
      '${dateTime.year}. ${dateTime.month}. ${dateTime.day}',
      style: TextStyle(
        color: DARKGREY_COLOR,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: [
      CustomButton(onPressed: onPressed,label: label,),
      const SizedBox(width: 4),
    ],
    iconTheme: IconThemeData(color: BLACK_COLOR),
    elevation: 0,
    backgroundColor: BACKGROUND_COLOR,
  );
}

