import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

/// Utility class for date and time formatting
class DateTimeFormatterUtils {
  /// Converts datetime string to formatted string (yyyy-MM-dd hh:mm a)
  static String formatDateTime(String time) {
    if (time.contains('0000-00-00')) {
      return 'not_spiffied'.tr();
    }

    try {
      final DateTime parseDate = DateTime.parse(time).toLocal();
      final formattedDate = DateFormat('yyyy-MM-dd   hh:mm a', 'en_US')
          .format(parseDate)
          .replaceAllMapped(RegExp(r'\b(AM|PM)\b'), (match) {
        return match.group(0) == 'AM' ? 'am'.tr() : 'pm'.tr();
      });
      return formattedDate;
    } catch (e) {
      return 'not_spiffied'.tr();
    }
  }
}

