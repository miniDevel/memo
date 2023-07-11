import 'package:flutter/material.dart';
import 'package:memo/const/colors.dart';


class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;

  const CustomContainer({
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
        decoration: BoxDecoration(
          color: WHITE_COLOR,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: LIGHTGREY_COLOR,
            width: 1,
          ),
        ),
        child: child,
      ),
    );
  }
}
