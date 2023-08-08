import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:memo/component/memo_card.dart';
import 'package:memo/const/custom_dialog.dart';
import 'package:memo/database/drift_database.dart';
import 'package:memo/screen/settimg_screen.dart';
import '../const/theme_colors.dart';
import 'memo_screen.dart';

class HomeScreen extends StatefulWidget {
  final ThemeColors theme;

  const HomeScreen({
    required this.theme,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeColors theme;

  @override
  void initState() {
    super.initState();
    theme = widget.theme;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingActionButton(context),
        backgroundColor: theme.BACKGROUND_COLOR,
        appBar: homeScreenAppbar(),
        body: MemoCardView(
          theme: theme,
        ),
      ),
    );
  }

  FloatingActionButton floatingActionButton(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MemoScreen(
              isEdit: false,
              theme: theme,
            ),
          ),
        );
      },
      backgroundColor: theme.PRIMARY_COLOR,
      child: const Icon(Icons.add),
    );
  }

  AppBar homeScreenAppbar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'M E M O',
        style: TextStyle(
          color: theme.DARKGREY_COLOR,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: IconThemeData(color: theme.BLACK_COLOR),
      elevation: 0,
      backgroundColor: theme.BACKGROUND_COLOR,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingScreen(
                  theme: theme,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.color_lens_outlined,
            size: 30,
            color: theme.DARKGREY_COLOR,
          ),
        ),
      ],
    );
  }
}

class MemoCardView extends StatelessWidget {
  final ThemeColors theme;

  const MemoCardView({
    required this.theme,
    super.key,
  });

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
                  color: theme.PRIMARY_COLOR,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "삭 제",
                    style: TextStyle(
                        color: theme.WHITE_COLOR,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          theme: theme,
                        );
                      },
                    );
                    if (result == true) {
                      GetIt.I<LocalDatabase>().removeMemo(memoData.id);
                    }
                  }
                  return;
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MemoScreen(
                          isEdit: true,
                          memoId: memoData.id,
                          dateTime: memoData.date,
                          theme: theme,
                        ),
                      ),
                    );
                  },
                  child: MemoCard(
                    firstLine: memoData.firstLine,
                    remainLines: memoData.remainingLines,
                    dateTime: memoData.date,
                    theme: theme,
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
