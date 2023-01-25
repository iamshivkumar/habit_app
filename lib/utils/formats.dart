import 'package:intl/intl.dart';

extension Formats on DateTime {
  String get labelDay => DateFormat('EEE').format(this).toUpperCase();
}
