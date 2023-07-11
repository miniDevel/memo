import 'dart:js_interop';

import 'package:flutter/material.dart';

import '../component/custom_appber.dart';
import '../component/custom_container.dart';
import '../const/colors.dart';

class MemoScreen extends StatelessWidget {
  const MemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double defaultBoxSize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppbar(true, () {
        Navigator.of(context).pop();
      }),
      backgroundColor: BACKGROUND_COLOR,
      body: CustomContainer(
        height: defaultBoxSize - 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomTextField(),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String firstLine = '';
  String remainingLines = '';

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String val) {
        final lines = val.split('\n');
        if (lines.isNotEmpty) {
          firstLine = lines.first;
          remainingLines = lines.sublist(1).join('\n');
        }
      },
      style: TextStyle(
        color: BLACK_COLOR,
        fontSize: 20,
      ),
      maxLines: null,
      cursorColor: DARKGREY_COLOR,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
