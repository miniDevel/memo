import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:memo/database/drift_database.dart';

import '../component/custom_appbar.dart';
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
        appBar: CustomAppbar(false, () {}),
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
    backgroundColor: PRIMARY_COLOR,
    child: const Icon(Icons.add),
  );
}

class MemoCardView extends StatelessWidget {
  const MemoCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: GetIt.I<LocalDatabase>().watchMemos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData && snapshot.data!.isNull) {
            return Center(child: Text('저장된 메모가 없습니다.'));
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MemoScreen(),
                    ),
                  );
                },
                child: CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 14.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Test commit',
                          style: TextStyle(color: BLACK_COLOR, fontSize: 20),
                        ),
                        Text(
                          '${DateTime.now().year}. ${DateTime.now().month}. ${DateTime.now().day}',
                          style: TextStyle(color: DARKGREY_COLOR, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '메모 둘째줄',
                          style: TextStyle(color: DARKGREY_COLOR, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemCount: 4,
          );
        });
  }
}
