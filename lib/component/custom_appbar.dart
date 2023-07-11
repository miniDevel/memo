import 'package:flutter/material.dart';

import '../const/colors.dart';

AppBar CustomAppbar(bool isMemo, VoidCallback onPressed) {
  return AppBar(
    centerTitle: true,
    title: isMemo
        ? Text(
            '${DateTime.now().year}. ${DateTime.now().month}. ${DateTime.now().day}',
            style: TextStyle(
              color: DARKGREY_COLOR,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          )
        : Text(
            '메 모',
            style: TextStyle(
              color: DARKGREY_COLOR,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
    actions: isMemo
        ? [
            SaveButton(
              onPressed: onPressed,
            ),
            const SizedBox(width: 4)
          ]
        : null,
    iconTheme: IconThemeData(color: BLACK_COLOR),
    elevation: 0,
    backgroundColor: BACKGROUND_COLOR,
  );
}

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 4.0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: PRIMARY_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          '완 료',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: WHITE_COLOR,
          ),
        ),
      ),
    );
  }
}
