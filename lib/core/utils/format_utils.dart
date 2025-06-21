import 'package:intl/intl.dart';

class FormatUtils {
  static String formatTime(DateTime dateTime) {
    return DateFormat.Hm().format(dateTime);
  }

  static String capitalizeFirst(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }
}
