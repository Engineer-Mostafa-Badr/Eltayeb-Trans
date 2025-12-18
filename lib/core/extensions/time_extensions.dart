import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';

extension TimeExtenstions on String {
  // convert 2025-09-23 23:55:00 to 'اليوم 09:30 م' or 'غدا 09:30 م' or '23 سبتمبر 09:30 م'
  String get toFormattedDate {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final tomorrow = today.add(const Duration(days: 1));

      final dateTime = DateTime.parse(this).toLocal();
      final year = dateTime.year;
      final month = dateTime.month;
      final day = dateTime.day;
      final target = DateTime(year, month, day);

      final timeFormat = DateFormat('hh:mm a', 'ar');
      final formattedTime = timeFormat.format(dateTime);

      if (target == today) {
        return '${'today'.tr()} $formattedTime'.toEnglishNumbers;
      } else if (target == tomorrow) {
        return '${'tomorrow'.tr()} $formattedTime'.toEnglishNumbers;
      } else {
        final dateFormat = DateFormat('d MMMM', 'ar');
        return '${dateFormat.format(dateTime)} $formattedTime'.toEnglishNumbers;
      }
    } catch (e) {
      return this;
    }
  }
}
