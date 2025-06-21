import 'package:intl/intl.dart';

class FormatUtils {
  static String formatTime(DateTime dateTime) {
    return DateFormat.Hm().format(dateTime);
  }
}
