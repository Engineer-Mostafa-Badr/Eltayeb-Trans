import 'package:flutter/services.dart';
import 'package:eltyp_delivery/core/utils/other_helpers.dart';

/// Utility class for clipboard operations
class ClipboardUtils {
  /// Copies text to clipboard
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Copies text to clipboard and shows success toast
  static Future<void> copyToClipboardWithToast(String text) async {
    await copyToClipboard(text);
    OtherHelper.showTopSuccessToast('copied_to_clipboard');
  }
}

