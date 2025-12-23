import 'dart:io';
import 'package:eltyp_delivery/core/utils/debug_utils.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher.dart';

/// Utility class for launching URLs and external applications
class UrlLauncherUtils {
  /// Launches a URL with specified mode
  static Future<void> launchUrl(
    String url, {
    LaunchMode launchMode = LaunchMode.externalApplication,
  }) async {
    try {
      await launcher.launchUrl(Uri.parse(url), mode: launchMode);
    } catch (e) {
      DebugUtils.printFullText(e.toString());
    }
  }

  /// Opens map with latitude and longitude
  static Future<void> openMapWithCoordinates(
    double latitude,
    double longitude,
  ) async {
    final url = Platform.isIOS
        ? 'http://maps.apple.com/?q=$latitude,$longitude'
        : 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    await launchUrl(url);
  }

  /// Opens map with location string
  static Future<void> openMapWithLocation(String location) async {
    final url = Platform.isIOS
        ? 'http://maps.apple.com/?q=$location'
        : 'https://www.google.com/maps/search/?api=1&query=$location';

    await launchUrl(url);
  }

  /// Opens phone dialer with phone number
  static Future<void> openCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    await launchUrl(url);
  }
}
