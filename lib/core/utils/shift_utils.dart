import 'package:easy_localization/easy_localization.dart';

/// Utility class for shift-related operations
class ShiftUtils {
  /// Returns localized shift name based on shift order
  static String getShiftName(int shiftOrder) {
    switch (shiftOrder) {
      case 0:
        return 'full_day'.tr();
      case 1:
        return 'first_shift'.tr();
      case 2:
        return 'second_shift'.tr();
      case 3:
        return 'third_shift'.tr();
      case 4:
        return 'fourth_shift'.tr();
      default:
        return '';
    }
  }
}

