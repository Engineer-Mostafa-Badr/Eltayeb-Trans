/// Utility class for number formatting
class NumberFormatterUtils {
  /// Converts number to K/M format (e.g., 1000 -> 1.0k, 1000000 -> 1.0m)
  static String convertToK(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}m';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    } else {
      return number.toString();
    }
  }
}

