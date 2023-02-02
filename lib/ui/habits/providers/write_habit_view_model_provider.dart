import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_app/core/models/habit.dart';
import 'package:habit_app/core/repositories/habit_repository.dart';
import 'package:habit_app/utils/formats.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final writeHabitViewModelProvider =
    ChangeNotifierProvider((ref) => WriteHabitViewModel(ref));

class WriteHabitViewModel extends ChangeNotifier {
  final Ref _ref;

  WriteHabitViewModel(this._ref){
    frequency = Map<String,int>.fromEntries(days.map((e) => MapEntry(e.labelDay, 1)));
  }

  List<DateTime> get days => List.generate(
        7,
        (index) {
          return DateTime.now()
              .add(Duration(days: index - DateTime.now().weekday));
        },
      );

  Habit? initial;

  String name = '';

  Map<String, int> frequency = {};
  List<TimeOfDay> reminders = [];

  bool _notification = false;
  bool get notification => _notification;
  set notification(bool value) {
    _notification = value;
    notifyListeners();
  }

  void toggleReminder(TimeOfDay time) {
    if(reminders.contains(time)){
      reminders.remove(time);
    } else {
      reminders.add(time);
    }
    notifyListeners();
  }


  void updateFrequency(String day, int count) {
    frequency[day] = count;
    notifyListeners();
  }

  HabitRepository get _repository => _ref.read(habitRepositoryProvider);

  Future<void> write() async {
    final updated = (initial ?? Habit.empty()).copyWith(
      name: name,
      frequency: frequency,
      reminders: reminders,
      notification: notification,
    );

    try {
      await _repository.writeHabit(updated);
    } on FirebaseException catch (e) {
      return Future.error(e.message ?? e.code);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
