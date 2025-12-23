import 'package:flutter/foundation.dart';
import 'package:eltyp_delivery/core/constants/app_constants.dart';

/// Utility class for debug operations
class DebugUtils {
  /// Prints full text by splitting into chunks (useful for long strings)
  static void printFullText(String text) {
    if (!kDebugMode) return;
    final pattern = RegExp('.{1,${AppConstants.debugTextChunkSize}}');
    pattern.allMatches(text).forEach(
          (match) => debugPrint(match.group(0).toString()),
        );
  }
}

