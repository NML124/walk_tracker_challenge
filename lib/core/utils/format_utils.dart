import 'package:intl/intl.dart';

class FormatUtils {
  static String formatTimeHourAndMinute(DateTime dateTime) {
    return DateFormat.Hm(Intl.getCurrentLocale()).format(dateTime);
  }

  static String formatTimeMonthAndYear(
    DateTime dateTime, {
    required String local,
  }) {
    return DateFormat.yMMMM(local).format(dateTime);
  }

  static String capitalizeFirst(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }
}
