import 'package:flutter/material.dart';
import 'package:memo/const/theme_colors.dart';

class CustomButton extends StatelessWidget {
  final ThemeColors theme;
  final VoidCallback onPressed;
  final String label;

  const CustomButton({
    required this.theme,
    required this.label,
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
          backgroundColor: theme.PRIMARY_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: theme.WHITE_COLOR,
          ),
        ),
      ),
    );
  }
}
