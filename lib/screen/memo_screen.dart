import 'package:flutter/material.dart';

import '../component/custom_appber.dart';
import '../component/custom_container.dart';
import '../const/colors.dart';


class MemoScreen extends StatelessWidget {
  const MemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double defaultBoxSize = MediaQuery.of(context).size.height ;

    return Scaffold(
      appBar: CustomAppbar(true, () {
        Navigator.of(context).pop();
      }),
      backgroundColor: BACKGROUND_COLOR,
      body: CustomContainer(
        height: defaultBoxSize-120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextField(
            style: TextStyle(
              color: BLACK_COLOR,
              fontSize: 20,
            ),
            maxLines: null,
            cursorColor: DARKGREY_COLOR,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
