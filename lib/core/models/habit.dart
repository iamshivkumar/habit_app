import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:habit_app/utils/formats.dart';

class Habit {
   String id;
   String name;
   Map<String, int> frequency;
   List<TimeOfDay> reminders;
   bool notification;
   DateTime createdAt;
   String createdBy;

  Habit({
    required this.id,
    required this.name,
    required this.frequency,
    required this.reminders,
    required this.notification,
    required this.createdAt,
    required this.createdBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'frequency': frequency,
      'reminders': reminders.map((x) => x.labelTime).toList(),
      'notification': notification,
      'createdAt': Timestamp.fromDate(createdAt),
      'createdBy': createdBy,
    };
  }

  factory Habit.fromMap(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return Habit(
      id: doc.id,
      name: map['name'] ?? '',
      frequency: Map<String, int>.from(map['frequency']),
      reminders: List<TimeOfDay>.from(
        map['reminders']?.map(
              (x) => Parsers.parse(x),
            ) ??
            [],
      ),
      notification: map['notification'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      createdBy: map['createdBy'] ?? '',
    );
  }

  // Habit copyWith({
  //   String? id,
  //   String? name,
  //   Map<String, int>? frequency,
  //   List<TimeOfDay>? reminders,
  //   bool? notification,
  //   DateTime? createdAt,
  //   String? createdBy,
  // }) {
  //   return Habit(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     frequency: frequency ?? this.frequency,
  //     reminders: reminders ?? this.reminders,
  //     notification: notification ?? this.notification,
  //     createdAt: createdAt ?? this.createdAt,
  //     createdBy: createdBy ?? this.createdBy,
  //   );
  // }

  

  factory Habit.empty(Map<String, int> fr) {
    return Habit(
      id: '',
      name: '',
      frequency: fr,
      reminders: [],
      notification: false,
      createdAt: DateTime.now(),
      createdBy: '',
    );
  }
  
}
