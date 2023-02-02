import 'package:flutter/material.dart';
import 'package:habit_app/ui/habits/write_habit_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page.dart';

enum _Page {
  home,
  writeHabit,
}

final writerProvider = StateProvider<bool>((ref) => false);


class HomeRoot extends ConsumerWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final forWrite = ref.watch(writerProvider);
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: HomePage(),
        ),
        if (forWrite)
          MaterialPage(
            key: ValueKey('write-habit'),
            child: WriteHabitPage(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        ref.read(writerProvider.notifier).state = false;
        return true;
      },
    );
  }
}
