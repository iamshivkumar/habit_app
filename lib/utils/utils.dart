class Utils {
  static List<DateTime> get weekDays => List.generate(
        7,
        (index) {
          return DateTime.now()
              .add(Duration(days: index - DateTime.now().weekday));
        },
      );

  static List<DateTime> allDaysOfMonth(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final weekday = firstDayOfMonth.weekday;
    final firstDay =
        firstDayOfMonth.subtract(Duration(days: weekday == 7 ? 0 : weekday));
    final lastWeekDay = lastDayOfMonth.weekday;
    final lastDay = lastDayOfMonth
        .add(Duration(days: 6 - (lastWeekDay == 7 ? 0 : lastWeekDay)));

    final days = <DateTime>[];
    do {
      days.add(
        days.isEmpty
            ? firstDay
            : days.last.add(
                Duration(days: 1),
              ),
      );
    } while (days.last != lastDay);
    return days;
  }
}
