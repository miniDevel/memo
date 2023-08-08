import 'package:flutter/material.dart';
import 'package:memo/const/theme_colors.dart';

class CustomContainer extends StatelessWidget {
  final ThemeColors theme;
  final Widget child;
  final double? height;

  const CustomContainer({
    required this.theme,
    this.height,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.WHITE_COLOR,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.LIGHTGREY_COLOR,
            width: 1,
          ),
        ),
        child: child,
      ),
    );
  }
}
