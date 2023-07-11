import 'package:flutter/material.dart';
import 'package:memo/const/colors.dart';

import '../const/custom_container.dart';

class MemoCard extends StatelessWidget {
  final String firstLine;
  final String remainLines;
  final DateTime dateTime;

  const MemoCard({
    required this.dateTime,
    required this.firstLine,
    required this.remainLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onlyFirstRemainLines = remainLines.split('\n').first;
    final limitedRemainLines = onlyFirstRemainLines.length > 30
        ? "${onlyFirstRemainLines.substring(0, 30)}..."
        : onlyFirstRemainLines;

    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 14.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstLine,
              style: TextStyle(color: BLACK_COLOR, fontSize: 20),
            ),
            Text(
              '${dateTime.year}. ${dateTime.month}. ${dateTime.day}',
              style: TextStyle(color: DARKGREY_COLOR, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              limitedRemainLines,
              style: TextStyle(color: DARKGREY_COLOR, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
