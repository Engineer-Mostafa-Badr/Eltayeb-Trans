import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';

final String notSpecified = 'not_specified'.tr();

/// Application-wide constants and configuration
class AppConst {
  /// Application name
  static const String appName = 'الطيب لخدمات النقل';

  /// Application version number (set from package info)
  static int versionNumber = 1;

  /// Flag to check if this is the first time the app is being checked
  static bool isFirstTimeCheck = true;

  /// Flag to indicate if the app is in review mode
  static bool appInReview = false;

  /// Default country code
  static const String countryCode = 'SA';

  /// Absence appointment cost (if applicable)
  static String absenceAppointmentCost = '150';

  /// Error message key for localization
  static const String errorText = 'something_went_wrong';

  /// Success message key for localization
  static const String successText = 'successful_operation';

  /// Google Maps API key
  static const String googleMapsApiKey =
      'AIzaSyASM7VEAkM0XHKds0Tlp7w--Hqd24k0BSo';

  /// Current user ID
  static int userId = 0;

  /// Orders alert message
  static String ordersAlert = '';

  /// Login status flag
  static bool isLogin = false;

  /// YouTube video ID (if applicable)
  static String youtubeVideoId = '';

  /// Current user model
  static UserModel? user;

  /// Currency symbol (localized)
  static String currency = 'sar'.tr();

  /// Minimum age duration (if applicable)
  static const Duration minimumAge = Duration(days: 6209, hours: 6);

  /// Returns the appropriate font name based on locale
  /// Currently uses Tajawal for all languages
  static String fontName(BuildContext context) {
    // All supported languages use Tajawal font
    return 'Tajawal';
  }

  /// List of app permissions
  static List<String> permissions = [];

  /// Most commonly used date format in the app
  static DateFormat mostUsedDateFormat = DateFormat('yyyy-MM-dd', 'en_US');

  /// BOXES NAMES
  static const mainBoxName = 'mainBox';
  static const userIdBox = 'userId';
  static const isDarkBox = 'isDarkBox';
  static const introFinishBox = 'introFinish';
  static const instructionsFinishBox = 'instructionsFinishBox';
  static const tokenBox = 'token';
  static const isLoggedInBox = 'isLoggedIn';
  static const currencyBox = 'currency';
  static const userBox = 'userDate';
  static const isVerifiedBox = 'isVerifiedBox';
  static const isAppUpdated = 'isAppUpdated';
}
