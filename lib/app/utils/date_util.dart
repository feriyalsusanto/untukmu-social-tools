import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(
    String? dateTime, {
    String format = 'yyyy-MM-dd HH:mm:ss',
  }) {
    if (dateTime == null) return '-';

    return DateFormat(format).format(DateTime.parse(dateTime));
  }
}
