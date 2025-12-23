import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class TripInfoCardWidget extends StatelessWidget {
  final String tripNumber;
  final String currentDriver;
  final String currentTruck;

  const TripInfoCardWidget({
    super.key,
    required this.tripNumber,
    required this.currentDriver,
    required this.currentTruck,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(
            label: 'trip_number',
            value: tripNumber,
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
            label: 'current_driver',
            value: currentDriver,
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
            label: 'current_truck',
            value: currentTruck,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: AppStyles.subtitle400.copyWith(
              color: AppColors.cTextSubtitleLight,
              fontSize: AppFontSize.f14,
            ),
          ).tr(),
        ),
        SizedBox(width: 16.w),
        Text(
          value,
          textAlign: TextAlign.left,
          style: AppStyles.title600.copyWith(
            color: Colors.black,
            fontSize: AppFontSize.f14,
          ),
        ),
      ],
    );
  }
}

