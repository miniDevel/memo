import 'package:flutter/material.dart';

import '../const/colors.dart';

AppBar homeScreenAppbar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      'M E M O',
      style: TextStyle(
        color: DARKGREY_COLOR,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: IconThemeData(color: BLACK_COLOR),
    elevation: 0,
    backgroundColor: BACKGROUND_COLOR,
  );
}
