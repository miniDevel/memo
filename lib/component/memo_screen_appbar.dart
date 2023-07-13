import 'package:flutter/material.dart';
import 'package:memo/const/colors.dart';
import 'package:memo/const/custom_button.dart';

AppBar memoScreenAppbar(
  DateTime dateTime,
  bool isEdit,
  VoidCallback onIconPressed,
  VoidCallback onButtonPressed,
  String label,
) {
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
      isEdit ? IconButton(onPressed: onIconPressed, icon: const Icon(Icons.delete)) : const Text(''),
      CustomButton(
        onPressed: onButtonPressed,
        label: label,
      ),
      const SizedBox(width: 4),
    ],
    iconTheme: IconThemeData(color: BLACK_COLOR),
    elevation: 0,
    backgroundColor: BACKGROUND_COLOR,
  );
}
