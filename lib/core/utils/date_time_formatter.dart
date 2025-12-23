/// Utility class for formatting date and time strings
class DateTimeFormatter {
  /// Formats a date-time string to a relative time label in Arabic
  /// Examples: "منذ 5 دقائق", "منذ ساعتين", "منذ 3 أيام", "2024-01-15"
  static String toRelativeTimeLabel(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 7) {
        return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
      } else if (difference.inDays > 0) {
        final days = difference.inDays;
        return 'منذ $days ${days == 1 ? 'يوم' : 'أيام'}';
      } else if (difference.inHours > 0) {
        final hours = difference.inHours;
        return 'منذ $hours ${hours == 1 ? 'ساعة' : 'ساعات'}';
      } else if (difference.inMinutes > 0) {
        final minutes = difference.inMinutes;
        return 'منذ $minutes ${minutes == 1 ? 'دقيقة' : 'دقائق'}';
      } else {
        return 'الآن';
      }
    } catch (e) {
      return dateTimeString;
    }
  }
}

/// Extension on String for date-time formatting
extension DateTimeFormatterExtension on String {
  String toRelativeTimeLabel() => DateTimeFormatter.toRelativeTimeLabel(this);
}

