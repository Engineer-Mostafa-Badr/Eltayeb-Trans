import 'package:easy_localization/easy_localization.dart';

/// Application-wide constants
class AppConstants {
  AppConstants._();

  // ========== Durations ==========
  static const Duration snackBarDuration = Duration(seconds: 3);
  static const Duration debounceDuration = Duration(milliseconds: 500);
  static const Duration connectionTimeout = Duration(seconds: 60);
  static const Duration idleTimeout = Duration(seconds: 60);

  // ========== Sizes ==========
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const double defaultIconSize = 24.0;

  // ========== Network ==========
  static const int maxConnectionsPerHost = 5;
  static const int debugTextChunkSize = 800;

  // ========== App Info ==========
  static const String appName = 'الطيب لخدمات النقل';
  static const String defaultCountryCode = 'SA';
  static const Duration minimumAge = Duration(days: 6209, hours: 6);

  // ========== Date Format ==========
  static DateFormat get mostUsedDateFormat => DateFormat('yyyy-MM-dd', 'en_US');
}
