import 'package:flutter/material.dart';
import 'package:habit_app/core/models/habit.dart';
import 'package:habit_app/ui/habits/habit_page.dart';
import 'package:habit_app/ui/habits/write_habit_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page.dart';

enum HomeState { home, writeHabit, habit }

final writerProvider = StateProvider<bool>((ref) => false);

final selectedHabitProvider = StateProvider<Habit?>((ref) => null);

class HomeRoot extends ConsumerWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forWrite = ref.watch(writerProvider);
    final habit = ref.watch(selectedHabitProvider);
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: HomePage(),
        ),
        if (habit != null)
          MaterialPage(
            key: ValueKey('habit'),
            child: HabbitPage(habit: habit),
          ),
        if (forWrite)
          MaterialPage(
            key: ValueKey('write-habit'),
            child: WriteHabitPage(
              habit: habit,
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (!forWrite) {
          ref.read(selectedHabitProvider.notifier).state = null;
        } else {
          ref.read(writerProvider.notifier).state = false;
        }
        return true;
      },
    );
  }
}
