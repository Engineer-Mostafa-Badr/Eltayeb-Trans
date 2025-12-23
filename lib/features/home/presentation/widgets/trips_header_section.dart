import '../../../../core/components/utils/custom_rounded_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class TripsHeaderSection extends StatelessWidget {
  const TripsHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'رحلاتي',
                  style: AppStyles.title700.copyWith(
                    fontSize: AppFontSize.f26,
                    color: AppColors.cDarkBlueColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'لديك 3 رحلات نشطة',
                  style: AppStyles.subtitle400.copyWith(
                    fontSize: AppFontSize.f14,
                    color: AppColors.cTextSubtitleDark,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
            decoration: BoxDecoration(
              color: AppColors.cPrimary.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '12',
                  style: AppStyles.title700.copyWith(
                    fontSize: AppFontSize.f34,
                    color: AppColors.cPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'رحلات هذا الشهر',
                  style: AppStyles.subtitle400.copyWith(
                    fontSize: AppFontSize.f12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
