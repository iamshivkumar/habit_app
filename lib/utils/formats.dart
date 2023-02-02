import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Formats on DateTime {
  String get labelDay => DateFormat('EEE').format(this).toUpperCase();
}

extension FormatTime on TimeOfDay {
  String get labelTime =>
      DateFormat('hh:mm a').format(DateTime(2022, 1, 1, hour, minute));
}

class Parsers {
 static TimeOfDay parse(String time) {
    final timeOfDay = DateFormat('hh:mm a').parse(time);
    return TimeOfDay(hour: timeOfDay.hour, minute: timeOfDay.minute);
  }
}
