import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/utils/clipboard_utils.dart';
import 'package:eltyp_delivery/core/utils/date_time_formatter_utils.dart';
import 'package:eltyp_delivery/core/utils/debug_utils.dart';
import 'package:eltyp_delivery/core/utils/device_utils.dart';
import 'package:eltyp_delivery/core/utils/number_formatter_utils.dart';
import 'package:eltyp_delivery/core/utils/shift_utils.dart';
import 'package:eltyp_delivery/core/utils/status_color_utils.dart';
import 'package:eltyp_delivery/core/utils/url_launcher_utils.dart';
import 'package:eltyp_delivery/core/services/firebase_topic_service.dart';
import 'package:url_launcher/url_launcher.dart';

/// Legacy class for backward compatibility
/// Consider migrating to specific utility classes
@Deprecated('Use specific utility classes instead')
class MostUsedFunctions {
  @Deprecated('Use ClipboardUtils.copyToClipboard instead')
  static Future<void> copyToClipboardFun(String text) async {
    await ClipboardUtils.copyToClipboard(text);
  }

  @Deprecated('Use DebugUtils.printFullText instead')
  static void printFullText(String text) {
    DebugUtils.printFullText(text);
  }

  static void closeKeyBoard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showSnackBarFun(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        content: Text(text, style: const TextStyle(color: Colors.white)).tr(),
        backgroundColor: AppColors.cPrimary,
      ),
    );
  }

  @Deprecated('Use ClipboardUtils.copyToClipboardWithToast instead')
  static Future<void> copyToClipboardAndShowSnackBarFun(String text) async {
    await ClipboardUtils.copyToClipboardWithToast(text);
  }

  @Deprecated('Use UrlLauncherUtils.launchUrl instead')
  static Future<void> urlLauncherFun(
    String url, {
    LaunchMode launchMode = LaunchMode.externalApplication,
  }) async {
    await UrlLauncherUtils.launchUrl(url, launchMode: launchMode);
  }

  @Deprecated('Use UrlLauncherUtils.openMapWithCoordinates instead')
  static Future<void> openMapFunWithLatLong(
    double latitude,
    double longitude,
  ) async {
    await UrlLauncherUtils.openMapWithCoordinates(latitude, longitude);
  }

  @Deprecated('Use UrlLauncherUtils.openMapWithLocation instead')
  static Future<void> openMapWithLocationFun(String location) async {
    await UrlLauncherUtils.openMapWithLocation(location);
  }

  @Deprecated('Use StatusColorUtils.getStatusColor instead')
  static Color statusColor(String status) {
    return StatusColorUtils.getStatusColor(status);
  }

  @Deprecated('Use NumberFormatterUtils.convertToK instead')
  static String convertNumberToK(int number) {
    return NumberFormatterUtils.convertToK(number);
  }

  @Deprecated('Use ShiftUtils.getShiftName instead')
  static String getShiftName(int shiftOrder) {
    return ShiftUtils.getShiftName(shiftOrder);
  }

  @Deprecated('Use DateTimeFormatterUtils.formatDateTime instead')
  static String convertDateTimeDDMMYYY(String time) {
    return DateTimeFormatterUtils.formatDateTime(time);
  }

  @Deprecated('Use DeviceUtils.getDeviceId instead')
  static Future<String?> getDeviceId() async {
    return DeviceUtils.getDeviceId();
  }

  @Deprecated('Use UrlLauncherUtils.openCall instead')
  static Future<void> openCallFun(String phoneNumber) async {
    await UrlLauncherUtils.openCall(phoneNumber);
  }

  @Deprecated('Use StatusColorUtils.getPaymentStatusColor instead')
  static Color paymentStatusColor(String status) {
    return StatusColorUtils.getPaymentStatusColor(status);
  }

  @Deprecated('Use FirebaseTopicService.subscribeToTopic instead')
  static Future<void> subscribeToTopic() async {
    await FirebaseTopicService.subscribeToTopic();
  }
}
