import 'package:flutter/material.dart';
import 'package:memo/const/theme_colors.dart';

class CustomDialog extends StatelessWidget {
  final ThemeColors theme;
  const CustomDialog({
    required this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: theme.BACKGROUND_COLOR,
      content: Text(
        '메모를 삭제 합니다.',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: theme.BLACK_COLOR),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            '아니오',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: theme.PRIMARY_COLOR),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            '삭 제',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: theme.PRIMARY_COLOR),
          ),
        ),
      ],
    );
  }
}
