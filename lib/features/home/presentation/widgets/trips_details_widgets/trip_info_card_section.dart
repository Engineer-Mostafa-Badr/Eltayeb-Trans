import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/utils/app_const.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../core/extensions/shared_extensions.dart';
import '../../../data/models/trips_model.dart';
import '../trip_status_badge.dart';
import '../trip_details_management_widgets/info_row.dart';

class TripInfoCardSection extends StatelessWidget {
  const TripInfoCardSection({super.key, required this.trip});

  final TripModel trip;

  String _formatDateForDisplay(String dateString) {
    try {
      final date = AppConst.mostUsedDateFormat.parse(dateString);
      final formatted = DateFormat('d MMMM yyyy', 'ar').format(date);
      return formatted.toEnglishNumbers;
    } catch (e) {
      return dateString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TripStatusBadge(status: trip.status),
              Text(
                'رحلة رقم ${trip.id}',
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: const Color(0xFF6B1D1D),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                trip.fromCity.name,
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward,
                size: 20.sp,
                color: AppColors.cTextSubtitleLight,
              ),
              SizedBox(width: 8.w),
              Text(
                trip.toCity.name,
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          InfoRow(
            label: 'تاريخ الاستلام',
            value: _formatDateForDisplay(trip.date),
          ),
          SizedBox(height: 12.h),
          InfoRow(
            label: 'تاريخ التسليم',
            value: _formatDateForDisplay(trip.date),
          ),
          SizedBox(height: 12.h),
          const InfoRow(
            label: 'ملاحظات',
            value: 'شحنة مواد غذائية.',
          ),
        ],
      ),
    );
  }
}
