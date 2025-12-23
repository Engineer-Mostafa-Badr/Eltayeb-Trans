import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'info_row.dart';

class TripInfoCard extends StatelessWidget {
  const TripInfoCard({
    super.key,
    required this.tripNumber,
    required this.originCity,
    required this.destinationCity,
    required this.pickupDate,
    required this.deliveryDate,
    required this.notes,
    required this.tripStatus,
  });

  final String tripNumber;
  final String originCity;
  final String destinationCity;
  final String pickupDate;
  final String deliveryDate;
  final String notes;
  final String tripStatus;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF5E6D3),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              tripStatus.tr(),
              style: AppStyles.title600.copyWith(
                fontSize: AppFontSize.f12,
                color: const Color(0xFF8B4513),
              ),
            ),
          ),
          16.sizedHeight,
          Text(
            'trip_number',
            style: AppStyles.title700.copyWith(fontSize: AppFontSize.f18),
          ).tr(),
          4.sizedHeight,
          Text(
            tripNumber,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f16,
              color: AppColors.cTextSubtitleLight,
            ),
          ),
          16.sizedHeight,
          Row(
            children: [
              Text(
                originCity,
                style: AppStyles.title700.copyWith(fontSize: AppFontSize.f16),
              ),
              8.sizedWidth,
              Icon(
                Icons.arrow_forward,
                size: 20.sp,
                color: AppColors.cTextSubtitleLight,
              ),
              8.sizedWidth,
              Text(
                destinationCity,
                style: AppStyles.title700.copyWith(fontSize: AppFontSize.f16),
              ),
            ],
          ),
          16.sizedHeight,
          InfoRow(label: 'pickup_date', value: pickupDate),
          12.sizedHeight,
          InfoRow(label: 'delivery_date', value: deliveryDate),
          if (notes.isNotEmpty) ...[
            12.sizedHeight,
            InfoRow(label: 'notes', value: notes),
          ],
        ],
      ),
    );
  }
}

