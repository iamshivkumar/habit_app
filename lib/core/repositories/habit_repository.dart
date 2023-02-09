import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/habit.dart';

final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  return HabitRepository();
});

class HabitRepository {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> writeHabit(Habit habit) async {
    await _firestore
        .collection('habits')
        .doc(habit.id.isEmpty ? null : habit.id)
        .set(
          habit.toMap(),
          SetOptions(merge: true),
        );
  }

  Stream<List<Habit>> getHabits(String uid) {
    return _firestore.collection('habits').where('createdBy',isEqualTo:uid ).snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Habit.fromMap(doc),
              )
              .toList(),
        );
  }
}
