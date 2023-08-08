import 'package:flutter/material.dart';
import 'package:memo/const/theme_colors.dart';

class SettingScreen extends StatefulWidget {
  final ThemeColors theme;

  const SettingScreen({
    required this.theme,
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late ThemeColors theme;

  @override
  void initState() {
    super.initState();
    theme = widget.theme;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Color Select',
            style: TextStyle(
              color: theme.DARKGREY_COLOR,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconTheme: IconThemeData(
            color: theme.DARKGREY_COLOR,
          ),
          leading: null,
          elevation: 0,
          centerTitle: true,
          backgroundColor: theme.BACKGROUND_COLOR,
        ),
        backgroundColor: theme.BACKGROUND_COLOR,
        body: Center(
          child: ElevatedButton(
            child: Text('뒤로가기'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
