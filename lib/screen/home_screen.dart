import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:memo/component/memo_card.dart';
import 'package:memo/database/drift_database.dart';

import '../component/home_screen_appbar.dart';
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
        appBar: homeScreenAppbar(),
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
    return StreamBuilder<List<Memo>>(
        stream: GetIt.I<LocalDatabase>().watchMemos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text('저장된 메모가 없습니다.'));
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final memoData = snapshot.data![index];

              return GestureDetector(
                onTap: () {
                 Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MemoScreen(
                        memoId: memoData.id,
                        dateTime: memoData.date,
                      ),
                    ),
                  );
                },
                child: MemoCard(
                  firstLine: memoData.firstLine,
                  remainLines: memoData.remainingLines,
                  dateTime: memoData.date,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemCount: snapshot.data!.length,
          );
        });
  }
}
