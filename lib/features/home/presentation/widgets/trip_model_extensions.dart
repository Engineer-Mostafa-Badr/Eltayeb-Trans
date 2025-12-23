import 'dart:ui';

import '../../../../config/themes/colors.dart';
import '../../data/models/trips_model.dart';

/// Extension for TripModel UI-related properties
extension TripUiX on TripModel {
  Color get statusColor {
    switch (status) {
      case 'pending':
        return AppColors.cRate;
      case 'in_progress':
        return AppColors.cLightBlueColor;
      case 'delivered':
        return AppColors.cSuccess;
      default:
        return AppColors.cLightBlueColor;
    }
  }

  String get statusLabel {
    switch (status) {
      case 'pending':
        return 'في الانتظار';
      case 'in_progress':
        return 'قيد التنفيذ';
      case 'delivered':
        return 'تم التوصيل';
      default:
        return status;
    }
  }

  bool get createdActive => true;

  bool get onRoadActive => status == 'in_progress' || status == 'delivered';

  bool get deliveredActive => status == 'delivered';

  String get dateText => date;
}
