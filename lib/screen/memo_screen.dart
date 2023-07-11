import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:memo/database/drift_database.dart';

import '../component/custom_appbar.dart';
import '../const/custom_container.dart';
import '../const/colors.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({super.key});

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  String? firstLine;
  String? remainingLines;

  @override
  Widget build(BuildContext context) {
    double defaultBoxSize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppbar(true, onSaveButton),
      backgroundColor: BACKGROUND_COLOR,
      body: CustomContainer(
        height: defaultBoxSize - 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomTextField(
            onTextChanged: onTextChanged,
          ),
        ),
      ),
    );
  }

  void onTextChanged(String val) {
    final lines = val.split('\n');
    if (lines.isEmpty) {
      return;
    } else {
      firstLine = lines.first;
      remainingLines = lines.sublist(1).join('\n');
    }
  }

  void onSaveButton() async {
    if (firstLine == null && remainingLines == null) {
      Navigator.of(context).pop();
    } else {
      await GetIt.I<LocalDatabase>().createMemo(
        MemosCompanion(
          firstLine: firstLine == null ? const Value("") : Value(firstLine!),
          remainingLines:
              remainingLines == null ? const Value("") : Value(remainingLines!),
        ),
      );
      Navigator.of(context).pop();
    }
  }
}

class CustomTextField extends StatelessWidget {
  final ValueChanged<String>? onTextChanged;
  const CustomTextField({
    required this.onTextChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTextChanged,
      style: TextStyle(
        color: BLACK_COLOR,
        fontSize: 20,
      ),
      maxLines: null,
      cursorColor: DARKGREY_COLOR,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
