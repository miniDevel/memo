import 'package:flutter/material.dart';

import '../component/custom_appber.dart';
import '../component/custom_container.dart';
import '../const/colors.dart';
import 'memo_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingActionButton(context),
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppbar(false,(){}),
        body: MemoCardView(),
      ),
    );
  }
}

FloatingActionButton floatingActionButton(context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MemoScreen(),
        ),
      );
    },
    child: Icon(Icons.add),
    backgroundColor: PRIMARY_COLOR,
  );
}

class MemoCardView extends StatelessWidget {
  const MemoCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
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
                  '메모의 첫줄',
                  style: TextStyle(color: BLACK_COLOR, fontSize: 20),
                ),
                Text(
                  '${DateTime.now().year}. ${DateTime.now().month}. ${DateTime.now().day}',
                  style: TextStyle(color: DARKGREY_COLOR, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  '메모 둘째줄',
                  style: TextStyle(color: DARKGREY_COLOR, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 8);
      },
      itemCount: 4,
    );
  }
}
