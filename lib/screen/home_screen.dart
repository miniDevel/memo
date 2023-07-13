import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:memo/component/memo_card.dart';
import 'package:memo/const/custom_dialog.dart';
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
        body: const MemoCardView(),
      ),
    );
  }
}

FloatingActionButton floatingActionButton(context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MemoScreen(
            isEdit: false,
          ),
        ),
      );
    },
    backgroundColor: PRIMARY_COLOR,
    child: const Icon(Icons.add),
  );
}

class MemoCardView extends StatefulWidget {
  const MemoCardView({super.key});

  @override
  State<MemoCardView> createState() => _MemoCardViewState();
}

class _MemoCardViewState extends State<MemoCardView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Memo>>(
        stream: GetIt.I<LocalDatabase>().watchMemos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                '저장된 메모가 없습니다.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final memoData = snapshot.data![index];

              return Dismissible(
                key: Key(memoData.id.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: PRIMARY_COLOR,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "삭 제",
                    style: TextStyle(
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return const CustomDialog();
                      },
                    );
                    if (result == true) {
                      GetIt.I<LocalDatabase>().removeMemo(memoData.id);
                    }
                  }
                  return ;
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MemoScreen(
                          isEdit: true,
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
