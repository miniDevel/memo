import 'package:flutter/material.dart';
import 'package:memo/const/colors.dart';



class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: BACKGROUND_COLOR,
      content: Text(
        '메모를 삭제 합니다.',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: BLACK_COLOR),
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
                color: PRIMARY_COLOR),
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
                color: PRIMARY_COLOR),
          ),
        ),
      ],
    );
  }
}
