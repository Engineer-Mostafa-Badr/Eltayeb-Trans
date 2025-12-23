import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../data/models/trips_model.dart';
import 'trip_model_extensions.dart';

/// Header section showing trip number and status badge
class TripCardHeader extends StatelessWidget {
  final TripModel trip;

  const TripCardHeader({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '${'trip_number'.tr()} ${trip.id}',
              style: AppStyles.title700.copyWith(
                color: AppColors.cDarkBlueColor,
                fontSize: AppFontSize.f16,
              ),
            ),
            const Spacer(),
            _TripStatusChip(label: trip.statusLabel, color: trip.statusColor),
          ],
        ),
        const Divider(color: AppColors.cHomeLiteCard),
      ],
    );
  }
}

class _TripStatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const _TripStatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(label, style: AppStyles.subtitle500.copyWith(color: color)),
    );
  }
}
