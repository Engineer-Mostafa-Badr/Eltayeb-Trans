import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';

/// Utility class for status color mapping
class StatusColorUtils {
  /// Returns color based on status string
  static Color getStatusColor(String status) {
    switch (status) {
      case 'partially paid':
      case 'transferred':
      case 'retreat':
        return AppColors.cAlert;
      case 'accepted':
      case 'confirmed':
      case 'approved':
      case 'in_active':
      case 'done':
      case 'attended':
      case 'examined':
        return AppColors.cPrimary;
      case 'refused':
      case 'cancelled':
      case 'rejected':
      case 'absent':
      case 'stopped':
      case 'unpaid':
      case 'partially retrieved':
        return AppColors.cError;
      case 'in_progress':
      case 'in-progress':
      case 'paid':
      case 'active':
        return AppColors.cSuccess;
      default:
        return Colors.grey;
    }
  }

  /// Returns color based on payment status
  static Color getPaymentStatusColor(String status) {
    switch (status) {
      case 'active':
      case 'in_progress':
      case 'finished':
        return AppColors.cSuccess;
      case 'waiting_vendor_offers':
      case 'offer_selected_waiting_vendor':
      case 'waiting_vendor_accept':
      case 'vendor_accepted':
      case 'advance_payment_paid':
      case 'delivery_confirmed':
      case 'cancelled':
      case 'vendor_rejected':
      case 'completed_by_vendor':
      case 'waiting_advance_payment':
      case 'waiting_final_payment':
        return AppColors.cError;
      default:
        return AppColors.cAlert;
    }
  }
}

