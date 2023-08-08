import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:memo/const/custom_button.dart';

import 'package:memo/const/custom_dialog.dart';
import 'package:memo/database/drift_database.dart';
import '../const/custom_container.dart';
import '../const/theme_colors.dart';

class MemoScreen extends StatefulWidget {
  final ThemeColors theme;
  final bool isEdit;
  final int? memoId;
  final DateTime? dateTime;

  const MemoScreen({
    required this.theme,
    required this.isEdit,
    this.memoId,
    this.dateTime,
    super.key,
  });

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  DateTime? dateTime;
  String? firstLine;
  String? remainingLines;

  @override
  Widget build(BuildContext context) {
    double defaultBoxSize = MediaQuery.of(context).size.height;
    if (widget.dateTime != null) {
      dateTime = widget.dateTime;
    }

    dateTime ??= DateTime.now();

    return FutureBuilder<Memo>(
      future: widget.memoId == null
          ? null
          : GetIt.I<LocalDatabase>().getMemoById(widget.memoId!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: widget.theme.BACKGROUND_COLOR,
              body: const Center(
                child: Text('메모를 불러올수 없습니다.'),
              ),
            ),
          );
        }

        if (snapshot.connectionState != ConnectionState.none &&
            !snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: widget.theme.BACKGROUND_COLOR,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        return SafeArea(
          child: Scaffold(
            appBar: memoScreenAppbar(
              dateTime!,
              widget.isEdit,
              () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog(
                      theme: widget.theme,
                    );
                  },
                );

                if (result == true) {
                  GetIt.I<LocalDatabase>().removeMemo(snapshot.data!.id);
                  Navigator.of(context).pop();
                }
              },
              widget.memoId == null ? onSaveButton : onEditButton,
              widget.memoId == null ? "완 료" : "수 정",
            ),
            backgroundColor: widget.theme.BACKGROUND_COLOR,
            body: CustomContainer(
              height: defaultBoxSize - 120,
              theme: widget.theme,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomTextField(
                  initialValue: snapshot.data == null
                      ? ""
                      : "${snapshot.data!.firstLine}\n${snapshot.data!.remainingLines}",
                  onTextChanged: onTextChanged,
                  theme: widget.theme,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onTextChanged(String val) {
    final lines = val.split('\n');
    if (lines.isEmpty) {
      return;
    } else {
      firstLine = lines.first;
      remainingLines = lines.sublist(1).join('\n');
      dateTime = DateTime.now();
    }
  }

  void onEditButton() async {
    if (firstLine == null && remainingLines == null) {
      Navigator.of(context).pop();
    } else {
      await GetIt.I<LocalDatabase>().updateMemoById(
        widget.memoId!,
        MemosCompanion(
          firstLine: firstLine == null ? const Value("") : Value(firstLine!),
          remainingLines:
              remainingLines == null ? const Value("") : Value(remainingLines!),
          date: Value(DateTime.now()),
        ),
      );
      Navigator.of(context).pop();
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
          date: Value(DateTime.now()),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  AppBar memoScreenAppbar(
    DateTime dateTime,
    bool isEdit,
    VoidCallback onIconPressed,
    VoidCallback onButtonPressed,
    String label,
  ) {
    return AppBar(
      centerTitle: true,
      title: Text(
        '${dateTime.year}. ${dateTime.month}. ${dateTime.day}',
        style: TextStyle(
          color: widget.theme.DARKGREY_COLOR,
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        isEdit
            ? IconButton(
                onPressed: onIconPressed, icon: const Icon(Icons.delete))
            : const Text(''),
        CustomButton(
          onPressed: onButtonPressed,
          label: label,
          theme: widget.theme,
        ),
        const SizedBox(width: 4),
      ],
      iconTheme: IconThemeData(color: widget.theme.BLACK_COLOR),
      elevation: 0,
      backgroundColor: widget.theme.BACKGROUND_COLOR,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final ThemeColors theme;
  final String initialValue;
  final ValueChanged<String> onTextChanged;

  const CustomTextField({
    required this.theme,
    required this.onTextChanged,
    required this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

    return TextField(
      controller: controller,
      onChanged: onTextChanged,
      style: TextStyle(
        color: theme.BLACK_COLOR,
        fontSize: 20,
      ),
      maxLines: null,
      cursorColor: theme.DARKGREY_COLOR,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
